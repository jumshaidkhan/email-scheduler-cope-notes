# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :recieved_messages
  has_many :messages, through: :recieved_messages

  def unsent_messages
    Message.pluck(:id) - self.messages.pluck(:id)
  end
end
