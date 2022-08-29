class AddUniqueIndexToRecieveMessage < ActiveRecord::Migration[6.1]
  def change
    add_index :recieved_messages, [:user_id, :message_id], unique: true
  end
end
