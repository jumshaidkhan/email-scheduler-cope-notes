# frozen_string_literal: true

class AddMessagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content

      t.timestamps
    end
  end
end
