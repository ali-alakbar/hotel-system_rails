# frozen_string_literal: true

module V1 
  class BookingsController < ApplicationController
    before_action :find_booking, only: %i[show destroy update]   
    before_action :check_booking_conflicts, only: %i[create]

    def index
      bookings = Booking.all
      if bookings.present?
        render_success(message: :data_found, data: bookings)
      else
        render_empty(root: :bookings, message: 'No bookings found')
      end
    end

    def available_rooms
      available_rooms = Booking.all.where.not(status: 'confirmed').where('check_out_date > ?', Date.today)
      if available_rooms.present?
        render_success(message: :data_found, data: available_rooms)
      else
        render_empty(root: :available_rooms, message: 'No available_rooms found')
      end
    end

    def booked_rooms
      booked_rooms = Booking.all.where(status: 'confirmed')
      if booked_rooms.present?
        render_success(message: :data_found, data: booked_rooms)
      else
        render_empty(root: :booked_rooms, message: 'No booked_rooms found')
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

    def bookings_params
      params.require(:booking).permit(:room_id, :employee_id, :check_in_date, :check_out_date, :holder_id, :status)
    end

    def check_booking_conflicts
      user_check_in_date = params[:booking][:check_in_date].to_date # to_date because i recieve it as a string
      user_check_out_date = params[:booking][:check_out_date].to_date
      room_id = params[:booking][:room_id]
      conflicting_bookings = Booking.where(room_id: room_id, status: 'confirmed').where(
        "check_in_date < ? AND check_out_date > ?", user_check_out_date, user_check_in_date
      ) # status should be cancled and within the range of date
      render_unprocessable_entity(message: 'Booking not allowed: The room is already booked.') unless !conflicting_bookings.exists?
    end

  end
end
