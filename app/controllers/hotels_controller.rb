class HotelsController < ApplicationController
  def index
    @hotel = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end


  def create
    @hotel = Hotel.new(hotels_params)
    if @hotel.save
        redirect_to hotels_path, notice:  "Hotel is saved successfully."
    else
        render 'new'
    end
    flash[:notice]
  end


  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_path
  end


  private
  
  def hotels_params
    params.require(:hotel).permit(:name, :city, :address, :phone_number)
  end
end