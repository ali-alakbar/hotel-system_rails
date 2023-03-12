class V1::RoomsController < ApplicationController
  
  before_action :find_room, only: %i[show destroy]   
  before_action :find_date_params, only: [:index]

  after_action do |room|
    puts "You have initilized the Room #{room}"
  end

  after_action do 
    Rails.logger.info("Request #{request.method} -- #{request.url}")
    Rails.logger.info("Response: #{response.status}")
  end
    
  def index
    rooms = Room.all
    rooms = filter_rooms_by_date(@from_date, @to_date).order(price: :asc) if @to_date != 1.week.from_now.strftime('%Y-%m-%d')
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

  def filter_rooms_by_date(from_date, to_date)
    @q.result(distinct: true).where(id: Booking.where('check_in_date < ? AND check_out_date > ?', to_date, from_date).select(:room_id))
  end

  def find_date_params
    if params[:q].present? && params[:q][:from_date_cont].present?
      @from_date = params[:q][:from_date_cont]
    else
      @from_date = Date.today.strftime('%Y-%m-%d')
    end

    if params[:q].present? && params[:q][:to_date_cont].present?
      @to_date = params[:q][:to_date_cont]
    else
      @to_date = 1.week.from_now.strftime('%Y-%m-%d')
    end
  end
  
  def find_room
    room ||= Room.find(params[:id])
  end
  
  def rooms_params
    params.require(:room).permit(:floor_number, :room_number, :max_capacity, :price, :reserved, :hotel_id)
  end
end
