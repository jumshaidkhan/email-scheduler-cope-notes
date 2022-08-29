# frozen_string_literal: true

class CreateRecievedMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :recieved_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
