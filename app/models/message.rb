# frozen_string_literal: true

class Message < ApplicationRecord
  has_many :recieved_messages, dependent: :destroy
  has_many :users, through: :recieved_messages
end
