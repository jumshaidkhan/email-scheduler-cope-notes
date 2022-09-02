# frozen_string_literal: true

class RecievedMessage < ApplicationRecord
  paginates_per 5
  belongs_to :message
  belongs_to :user
  validates :user, uniqueness: { scope: :message_id }
end
