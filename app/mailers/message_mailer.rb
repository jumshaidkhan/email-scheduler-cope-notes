class MessageMailer < ApplicationMailer
  default from: 'abc@gmail.com'
  
  def submission(user, message)
    if user.unsent_messages.any?
      @message = message.content
      RecievedMessage.create(user_id: user.id, message_id: message.id) 
      mail(to: user.email, subject: 'Reminder')
    end
  end
end
