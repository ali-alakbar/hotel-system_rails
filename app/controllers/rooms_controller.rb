class RoomsController < ApplicationController
  
  before_action :find_room_id, only: %i[show destroy]   

  def index
    @rooms = Room.all
  end

  def show
    
  end


  def new
    @room = Room.new
  end


  
  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to rooms_path
    else
      puts "======"
      puts @room.errors.full_messages
      render 'new'
    end
  end

  
  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def find_room_id
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:room).permit(:floor_number, :room_number, :max_capacity, :price, :reserved)
  end
end
