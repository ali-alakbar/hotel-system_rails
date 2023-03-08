
class V1::GuestsController < ApplicationController
  
  before_action :find_guest, only: %i[show destroy]   
  
  def index
    guests = Guest.all
    render_success(message: "Data found", data: guests)
    render_empty(root: 'guests', message: 'No guests found') if guests.nil?
  end

  def show
    render_success(message: "Data found", data: @guest)
  end

  def create
    @guest = Guest.create(guests_params)
    if @guest.save
      render_created(message: "Data created", data: @guest)
    else
      render_unprocessable_entity(message: @guest.errors.full_messages.join(', '))
    end
  end

  def destroy
    if @guest.destroy
      render_success(message: 'Data deleted')
    else
      render_unprocessable_entity(message: 'Data could not be deleted')
    end
  end

  private
  
  def find_guest
    @guest = Guest.find(params[:id])
  end

  def guests_params
    params.require(:guest).permit(:full_name_ar, :full_name_en, :id_card_number, :passport_number, :mobile_number, :email, :birthday, :booking_id)
  end
end

