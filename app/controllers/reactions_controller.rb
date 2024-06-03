class ReactionsController < ApplicationController

	def create
		@message = Message.find(params[:message_id])
		@reaction = @message.reactions.build(reaction_params)
		@reaction.user = current_user

		if @reaction.save

		    redirect_to chat_room_path(@message.chat_room)
		else 
		   
		   redirect_to chat_room_path(@message.chat_room), alert: "Unable to add reaction."
		end    
	end

	private

	def reaction_params
		params.require(:reaction).permit(:reaction_type)
	end
end
