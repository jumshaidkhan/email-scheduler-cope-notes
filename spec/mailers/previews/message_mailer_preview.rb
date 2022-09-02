# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/message_mailer
class MessageMailerPreview < ActionMailer::Preview
  def submission
    MessageMailer.with(user: User.first, message: Message.first).submission
  end
end
