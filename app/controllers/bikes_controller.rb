class BikesController < ApplicationController

    def new
        @user = User.find(current_user.id)
        @bike = Bike.new
    end

    def index
        @bikes = Bike.all
    end

    def edit
        @bike = Bike.find(params[:id])
    end

    def update
        @bike = Bike.find(params[:id])
        if @bike.update(bike_params)
          redirect_to @bike, notice: 'Bike was successfully updated.'
        else
          render :edit
        end
    end

    def create
        @bike = Bike.new(bike_params)
        @user = User.find(current_user.id)
        @bike.user = @user
        if @bike.save
            redirect_to @bike, notice: 'Bike was added'
        else
            render :new
        end

    end

    def show
        @bike = Bike.find(params[:id])
        @bookings = Booking.new

    end
    
    private

    def bike_params
        params.require(:bike).permit(:title, :photo)
        
    end
    
end
