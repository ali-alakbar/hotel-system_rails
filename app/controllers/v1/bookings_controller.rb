
class V1::BookingsController < ApplicationController
  
  before_action :find_booking, only: %i[show destroy update edit]   
  
  def index
    bookings = Booking.all
    if bookings.present?
      render_success(message: "Data found", data: bookings)
    else
      render_empty(root: 'bookings', message: 'No bookings found')
    end
  end

  def show
    render_success(message: "Data found", data: @booking)
  end

  def update
    if @booking.update(bookings_params)
      render_success(message: "Data found", data: @booking)
      BookingMailer.booking_confirmation(@booking).deliver_now
    else
      render_unprocessable_entity(message: @booking.errors.full_messages.join(', '))
    end
  end
  
  def create
    @booking = Booking.create(bookings_params)
    if @booking.save
      render_success(message: "Data created", data: @booking)
    else
      render_unprocessable_entity(message: @booking.errors.full_messages.join(', '))
    end
  end

  def destroy
    @booking.destroy
    if @booking.destroy
      render_success(message: 'Data deleted')
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end
  end

  private
  
  def find_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:room_id, :employee_id, :check_in_date, :check_out_date, :holder_id, :status)
  end

  def return_400_error(message)
    render json: { error: message }, status: :bad_request
  end

end

