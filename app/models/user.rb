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
    message = unsent_messages.sample
    SendMessageJob.perform_later(self, message) if message
  end

  def unsent_messages
    Message.where.not(id: messages.ids)
  end
end
