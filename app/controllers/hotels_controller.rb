class HotelsController < ApplicationController
  
  before_action :find_hotel_id, only: %i[show destroy]   
  
  def index
    @hotels = Hotel.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end


  def create
    @hotel = Hotel.new(hotels_params)
    if @hotel.save
      redirect_to hotels_path
    else
      render 'new'
    end
  end


  def destroy
    @hotel.destroy
    redirect_to hotels_path
  end


  private
  
  def find_hotel_id
    @hotel = Hotel.find(params[:id])
  end

  def hotels_params
    params.require(:hotel).permit(:name, :city, :address, :phone_number)
  end
end

