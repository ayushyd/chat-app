class MessagesController < ApplicationController

	def create
		@chat_room = ChatRoom.find(params[:chat_room_id])
		@message = @chat_room.messages.build(msg_params)
		@message.user = current_user

		if @message.save
			redirect_to @chat_room
        else
        	render 'chat_rooms/show'
        end
	end

	private

	def msg_params
		params.require(:message).permit(:context, :attachment)
	end

end
