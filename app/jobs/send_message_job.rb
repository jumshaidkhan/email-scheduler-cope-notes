class SendMessageJob < ApplicationJob
  queue_as :default
  
  def perform(email, content)
    user = User.find_by_email(email)
    message = Message.find_by_content(content)
    if user.unsent_messages.any?
      MessageMailer.submission(user, message)

      SendMessageJob.set(wait: 1.minute).perform_later( email, content)
    end
      # Do something later
  end
end
