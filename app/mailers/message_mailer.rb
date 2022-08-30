class MessageMailer < ApplicationMailer
  default from: 'abc@gmail.com'
  
  def submission
    user = params[:user]
    message = params[:message]
    @message = message.content
    RecievedMessage.create(user_id: user.id, message_id: message.id) 
    mail(to: user.email, subject: 'Reminder')
  end
  
end
