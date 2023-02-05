class RoomsController < ApplicationController
  
  before_action :find_room_id, only: %i[show destroy]   

  def index
    @rooms = Room.all
  end

  def show
    
  end


  def new
    @room = Room.new
  end


  
  def create
    @room = Room.new(rooms_params)
    if @room.save
      redirect_to rooms_path
    else
      render 'new'
    end
  end

  
  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def find_room_id
    @room = Room.find(params[:id])
  end


    def new
        @room = Room.new

    end


    def create
        @room = Room.new(rooms_params)
        if @room.save
            redirect_to rooms_path, notice:  "Room is saved successfully."
        else
            puts "==========="
            puts @room.errors.full_messages
            puts "==========="
            render 'new'
        end
        flash[:notice]

    end


    def destroy
        @room = Room.find(params[:id])
        @room.destroy
        redirect_to rooms_path
    end


    private
    def rooms_params
        params.require(:room).permit(:floor_no, :room_no, :max_capacity, :price, :hotel_name, :hotel_id)
    end
end
