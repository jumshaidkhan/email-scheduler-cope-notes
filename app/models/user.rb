# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :recieved_messages
  has_many :messages, through: :recieved_messages
  after_create :send_mail
  
  def send_mail
    messages = Message.pluck(:id) - self.messages.pluck(:id)
    SendMessageJob.perform_later(self, Message.find(messages.sample)) if messages.any?
  end
  
  def unsent_messages
    Message.pluck(:id) - self.messages.pluck(:id)
  end

end
