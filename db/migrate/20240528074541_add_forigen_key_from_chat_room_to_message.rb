class AddForigenKeyFromChatRoomToMessage < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :chat_room, null: false, foreign_key: true, index: true
  end
end
