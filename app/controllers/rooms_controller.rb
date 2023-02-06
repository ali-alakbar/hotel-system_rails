class RoomsController < ApplicationController
  def index
      @rooms = Room.all
  end

  def show
      @rooms = Room.find(params[:id])
  end

  def edit
      @rooms = Room.find(params[:id])
  end

  def update
      @rooms = Room.find(params[:id])
      if @rooms.update(rooms_params)
          redirect_to rooms_path
      else
          render 'new'
      end
  end


  def new
      @rooms = Room.new

  end


  def create
      @rooms = Room.new(rooms_params)
      if @rooms.save
          redirect_to rooms_path, notice:  "Room is saved successfully."
      else
          puts "==========="
          puts @rooms.errors.full_messages
          puts "==========="
          render 'new'
      end
      flash[:notice]

  end


  def destroy
      @rooms = Room.find(params[:id])
      @rooms.destroy
      redirect_to rooms_path
  end


  private
  
  def rooms_params
      params.require(:room).permit(:floor_no, :room_no, :max_capacity, :price, :hotel_name, :hotel_id)
  end
end
