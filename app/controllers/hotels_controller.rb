class HotelsController < ApplicationController
    def index
        @hotel = Hotel.all
    end

    def show
        @hotel = Hotel.find(params[:id])
    end

    def edit
        @hotel = Hotel.find(params[:id])
    end

    def update
        @hotel = Hotel.find(params[:id])
        if @hotel.update(hotel_params)
            redirect_to hotels_path
        else
            render 'new'
        end
    end


    def new
        @hotel = Hotel.new
    end


    def create
        @hotel = Hotel.new(hotel_params)
        if @hotel.save
            redirect_to hotels_path
        else
            render 'new'
        end
    end


    def destroy
        @hotel = Hotel.find(params[:id])
        @hotel.destroy
        redirect_to hotels_path
    end


    private
    def hotel_params
        params.require(:hotel).permit(:hotel_name, :hotel_id)
    end
end