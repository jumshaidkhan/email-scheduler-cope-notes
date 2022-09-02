# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  default from: 'abc@gmail.com'

  def submission
    user = params[:user]
    message = params[:message]
    @message = message.content
    received_messsage = RecievedMessage.new(user_id: user.id, message_id: message.id)
    mail(to: user.email, subject: 'Reminder') if received_messsage.save
  end
end
