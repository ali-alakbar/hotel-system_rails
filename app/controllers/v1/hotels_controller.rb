
class V1::HotelsController < ApplicationController
  
  before_action :find_hotel, only: %i[show destroy]   
  
  def index
    hotels = Hotel.all
    render_success(message: "Data found", data: hotels)
    render_empty(root: 'hotels', message: 'No hotels found') if hotels.nil?
  end

  def show
    render_success(message: "Data found", data: @hotel)
  end
  
  def create
    @hotel = Hotel.create(hotels_params)
    render_created(message: "Data created", data: @hotel)
    render_unprocessable_entity(message: @hotel.errors.full_messages.join(', ')) if @hotel.save == false
  end

  def destroy
    render_success(message: 'Data deleted')
    render_unprocessable_entity(message: 'Data could not be deleted') if @hotel.destroy == false
  end

  private
  
  def role_name
    "#{role.name_en} (#{role.name_ar})"
  end

  def find_hotel
    @hotel ||= Hotel.find(params[:id])
  end

  def hotels_params
    params.require(:hotel).permit(:name, :city, :address, :phone_number)
  end
end

