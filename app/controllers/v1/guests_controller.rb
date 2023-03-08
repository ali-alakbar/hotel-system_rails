
class V1::GuestsController < ApplicationController
  
  before_action :find_guest, only: %i[show destroy]   
  
  def index
    guests = Guest.all
    if guests.present?
      render_success(message: :data_found, data: guests)
    else
      render_empty(root: :guests, message: :no_record_found) 
    end
  end

  def show
    render_success(message: :data_found, data: @guest)
  end

  def create
    @guest = Guest.create(guests_params)
    if @guest.save
      render_created(message: :data_created, data: @guest)
    else
      render_unprocessable_entity(message: @guest.errors.full_messages.join(', '))
    end
  end

  def destroy
    if @guest.destroy
      render_success(message: :data_removed)
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

