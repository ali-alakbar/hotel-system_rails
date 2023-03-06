
class V1::BookingsController < ApplicationController
  
  before_action :find_booking_id, only: %i[show destroy update edit]   
  
  def index
    @bookings = Booking.all
  end

  def show
  end
  
  def new
    @booking = Booking.new
  end

  def edit
    
  end

  def update

    if @booking.update(bookings_params)
      redirect_to v1_bookings_path
    else
      render 'new'
    end
  end
  
  def create
    @booking = Booking.create(bookings_params)
    if @booking.save
      redirect_to v1_bookings_path
    else
      render 'new'
    end
  end

  def destroy
    @booking.destroy
    redirect_to v1_bookings_path
  end

  private
  
  def find_booking_id
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:room_id, :employee_id, :check_in_date, :check_out_date, :holder_id, :status)
  end

  def return_400_error(message)
    render json: { error: message }, status: :bad_request
  end

end

