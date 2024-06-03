class RemoveForeginKeyFromMessageToRoom < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :messages, :rooms
    remove_column :messages, :room_id
  end
end
