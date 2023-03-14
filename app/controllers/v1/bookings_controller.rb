# frozen_string_literal: true

module V1 
  class BookingsController < ApplicationController
    before_action :find_booking, only: %i[show destroy update]   

    def index
      bookings = Booking.all
      if bookings.present?
        render_success(message: :data_found, data: bookings)
      else
        render_empty(root: :bookings, message: 'No bookings found')
      end
    end

    def show
      if find_booking.present?
        render_success(message: :data_found, data: find_booking)
      else
        render_not_found(message: 'Booking not found')
      end
    end

    def create  
      booking = Booking.create(bookings_params)
      if booking.save
        render_created(message: :data_created, data: booking)
      else
        render_unprocessable_entity(message: booking.errors.full_messages.join(', '))
      end
    end

    def update
      if find_booking.update(bookings_params)
        render_created(message: :data_updated, data: find_booking)
      else
        render_unprocessable_entity(message: find_booking.errors.full_messages.join(', '))
      end
    end

    def destroy
      if find_booking.destroy
        render_success(message: :data_removed)
      else
        render_unprocessable_entity(message: 'Data could not be deleted')
      end
    end

    private
    
    def find_booking
      @find_booking ||= Booking.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @find_booking = nil
      end
    end

    def bookings_params
      params.require(:booking).permit(:room_id, :employee_id, :check_in_date, :check_out_date, :holder_id, :status)
    end

end
