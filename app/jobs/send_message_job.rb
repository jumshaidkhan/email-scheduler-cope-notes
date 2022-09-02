# frozen_string_literal: true

class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(user, message)
    if user.unsent_messages.any?
      MessageMailer.with(user: user, message: message).submission.deliver_now
      SendMessageJob.set(wait: 1.minute).perform_later(user, user.unsent_messages.sample) if user.unsent_messages.any?
    end
    # Do something later
  end
end
