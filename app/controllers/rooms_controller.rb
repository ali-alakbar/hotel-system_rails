class RoomsController < ApplicationController
    def index
        flash[:notice] 
        if Hotel.count == 0
            puts "You must create a hotel"
            redirect_to root_path, notice: "Please add a hotel first."
        else
            @room = Room.all
        end
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
        hotel = Hotel.find_by(hotel_id: @room.room_id)
        hotel_id = hotel.hotel_id.to_s.gsub(" ", "") if hotel.try(:hotel_id).present?
        room_id = @room.room_id.gsub(" ", "")
        
        if hotel_id == room_id
            @room.hotel_id = hotel.id
            if @room.save
                redirect_to rooms_path, notice:  "Room is saved successfully."
            else
                redirect_to rooms_path, notice:  "You must create a hotel first."
            end
        else

        redirect_to rooms_path, notice:  "The hotel ID is NOT exist, You must create a hotel first."
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
        params.require(:room).permit(:floor_no, :room_no, :max_capacity, :price, :room_id)
    end
end