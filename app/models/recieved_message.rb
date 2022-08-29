# frozen_string_literal: true

class RecievedMessage < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
