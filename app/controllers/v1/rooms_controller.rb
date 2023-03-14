# frozen_string_literal: true

module V1
  class RoomsController < ApplicationController
    before_action :find_room, only: %i[show destroy]

    def index
      rooms = Room.all
      if rooms.present?
        render_success(message: :data_found, data: rooms)
      else
        render_empty(root: :rooms, message: :no_record_found)
      end
    end

    def show
      if find_room.present?
        render_success(message: :data_found, data: find_room)
      else
        render_not_found(message: 'Room not found')
      end
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
      if find_room.destroy
        render_success(message: :data_removed)
      else
        render_unprocessable_entity(message: 'Data could not be deleted')
      end 
    end

    private

    def find_room
      @find_room ||= Room.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @find_room = nil
    end

    def rooms_params
      params.require(:room).permit(:floor_number, :room_number, :max_capacity, :price, :reserved, :hotel_id)
    end
  end
end
