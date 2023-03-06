
class V1::HotelsController < ApplicationController
  
  before_action :find_hotel_id, only: %i[show destroy]   
  
  def index
    @q = Hotel.ransack(params[:q])
    @hotels = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
  end
  
  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.create(hotels_params)
    if @hotel.save
      redirect_to v1_hotels_path
    else
      render 'new'
    end
  end

  def destroy
    @hotel.destroy
    redirect_to v1_hotels_path
  end

  private
  
  def role_name
    "#{role.name_en} (#{role.name_ar})"
  end

  def find_hotel_id
    @hotel = Hotel.find(params[:id])
  end

  def hotels_params
    params.require(:hotel).permit(:name, :city, :address, :phone_number)
  end
end

