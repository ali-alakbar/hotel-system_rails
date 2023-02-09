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
    if @rooms.update(rooms_params)
        redirect_to rooms_path
    else
        render 'edit'
    end
  end


  def new
    @rooms = Room.new
  end


  def create
    @rooms = Room.new(rooms_params)
    if @rooms.save
        redirect_to rooms_path
    else
        render 'new'
    end
  end


  def destroy
    @rooms.destroy
    redirect_to rooms_path
  end


  private
  def find_rooms
    @rooms = Room.find(params[:id])
  end
  
  def rooms_params
    params.require(:room).permit(:floor_no, :room_no, :max_capacity, :price, :hotel_name, :hotel_id)
  end
end
