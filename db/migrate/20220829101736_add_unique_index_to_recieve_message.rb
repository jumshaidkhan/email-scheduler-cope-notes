# frozen_string_literal: true

class AddUniqueIndexToRecieveMessage < ActiveRecord::Migration[6.1]
  def change
    add_index :recieved_messages, %i[user_id message_id], unique: true
  end
end
