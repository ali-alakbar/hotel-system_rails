class RoomsController < ApplicationController
  before_action :find_rooms , only: [:show, :edit, :update, :destroy]  

  after_action do |room|
    puts "You have initilized the Room #{room}"
  end

  after_action do 
    Rails.logger.info("Request #{request.method} -- #{request.url}")
    Rails.logger.info("Response: #{response.status}")
  end
    
  def index
    @rooms = Room.all
  end

  def show
  end

  def edit
  end

  def update
    if @room.update(rooms_params)
      redirect_to rooms_path
    else
      render 'edit'
    end
  end


  def new
    @room = Room.new
  end


  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end


  def destroy
    @room.destroy
    redirect_to rooms_path
  end


  private
  def find_rooms
    @room = Room.find(params[:id])
  end
  
  def rooms_params
    params.require(:room).permit(:floor_number, :room_number, :max_capacity, :price, :reserved, :hotel_id)
  end
end
