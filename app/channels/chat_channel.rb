class ChatChannel < ApplicationCable::Channel
  def subscribed
     stream_from "chat_#{params[:chat_room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create!(content: data['message'], chat_room_id: data['chat_room_id'], user: current_user)
  end
end
