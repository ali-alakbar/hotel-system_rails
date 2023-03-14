# frozen_string_literal: true

module V1
  class HotelsController < ApplicationController
    before_action :find_hotel, only: %i[show destroy]   

    def index
      hotels = Hotel.all
      if hotels.present?
        render_success(message: :data_found, data: hotels)
      else
        render_empty(root: :hotels, message: 'No hotels found')
      end
    end

    def show
      if find_hotel.present?
        render_success(message: :data_found, data: find_hotel)
      else
        render_not_found(message: 'Hotel not found')
      end
    end

    def create
      hotel = Hotel.create(hotels_params)
      if hotel.save
        render_created(message: :data_created, data: hotel)
      else
        render_unprocessable_entity(message: hotel.errors.full_messages.join(', '))
      end
    end

    def destroy
      if find_hotel.destroy
        render_success(message: :data_removed)
      else
        render_unprocessable_entity(message: 'Data could not be deleted')
      end
    end

    private

    def role_name
      "#{role.name_en} (#{role.name_ar})"
    end

    def find_hotel
      begin
        @find_hotel ||= Hotel.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @find_hotel = nil
      end
    end

    def hotels_params
      params.require(:hotel).permit(:name, :city, :address, :phone_number)
    end

end