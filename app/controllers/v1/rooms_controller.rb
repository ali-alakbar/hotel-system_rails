class V1::RoomsController < ApplicationController
  
  before_action :find_room, only: %i[show destroy]   

  after_action do |room|
    puts "You have initilized the Room #{room}"
  end

  after_action do 
    Rails.logger.info("Request #{request.method} -- #{request.url}")
    Rails.logger.info("Response: #{response.status}")
  end
    
  def index
    rooms = Room.all
    if rooms.present?
      render_success(message: :data_found, data: rooms)
    else
      render_empty(root: :rooms, message: :no_record_found)
    end
  end

  def show
    render_success(message: :data_found, data: find_room)
  end
  
  def create
    room = Room.new(rooms_params)
    if room.save
      render_created(message: :data_created, data: room)
    else
      render_unprocessable_entity(message: room.errors.full_messages.join(', '))
    end
  end

  def destroy
    room = find_room
    if room.destroy
      render_success(message: :data_removed)
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end 
  end
  
  private
  
  def find_room
    room ||= Room.find(params[:id])
  end
  
  def rooms_params
    params.require(:room).permit(:floor_number, :room_number, :max_capacity, :price, :reserved, :hotel_id)
  end
end
