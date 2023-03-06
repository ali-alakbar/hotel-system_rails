
class V1::GuestsController < ApplicationController
  
  before_action :find_guest_id, only: %i[show destroy]   
  
  def index
    @guests = Guest.all
  end

  def show
  end
  
  def new
    @guest = Guest.new
  end
  
  def create
    @guest = Guest.create(guests_params)
    if @guest.save
      redirect_to v1_guests_path
    else
      puts @guest.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @guest.destroy
    redirect_to v1_guests_path
  end

  private
  
  def find_guest_id
    @guest = Guest.find(params[:id])
  end

  def guests_params
    params.require(:guest).permit(:full_name_ar, :full_name_en, :id_card_number, :passport_number, :mobile_number, :email, :birthday, :booking_id)
  end
end

