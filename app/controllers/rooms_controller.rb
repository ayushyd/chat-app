class RoomsController < ApplicationController
  def index
    @current_user = current_user
    @room = Room.all
    @users = User.all_except(@current_user)
  end

  def show
    @current_user = current_user
    @single = Room.find(params[:id])
    @room = Room.public_room
    @users = User.all_except(@current_user)
    @room = Room.new
    @messages = @single_room.messages

    render "index"
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new
    if @room.save(room_params)
      redirect_to to root_path, notice: "Room add Sucessfully!"
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private


  def room_params
    params.require(:room).permit(:name)
  end
end
