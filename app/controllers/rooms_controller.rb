class RoomsController < ApplicationController
    
  def index
    @room = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(rooms_params)
        redirect_to rooms_path
    else
        render 'new'
    end
  end


  def new
    @room = Room.new
  end


  
  def create
  
    @room = Room.new(rooms_params)
        if @room.save
            redirect_to rooms_path, notice:  "Room is saved successfully."
        else
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
        params.require(:room).permit(:floor_no, :room_no, :max_capacity, :price)
    end
  end
