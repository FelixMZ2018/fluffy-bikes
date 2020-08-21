class BikesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]


    def map
        @bikes = Bike.geocoded # returns flats with coordinates
        p @bikes

        @markers = @bikes.map do |bike|
          {
            lat: bike.latitude,
            lng: bike.longitude
          }
          authorize @bikes

      end
    end

    def new
        @user = User.find(current_user.id)
        @bike = Bike.new
        @categories = ["eBike", "City Bike","Mountain Bike","Fixed Gear","Road Bike","Trecking Bike","Unicycle"]
        @districts = District.all
        authorize @bike
    end

    def index
        @bikes = policy_scope(Bike).order(created_at: :desc)
        @bikes = @bikes.search_by_title_and_description(params[:query]) if params[:query].present?
        @bikes = Bike.where('category ILIKE ?', "%#{params[:category]}%") if params[:category].present?
      if params[:district].present?
        @district = District.find_by_name(params[:district])
        @bikes = Bike.where(district_id: @district)
      end
    end

    def edit
        @bike = Bike.find(params[:id])
        @user = User.find(current_user.id)
        @categories = ["eBike", "City Bike"]
        @districts = District.all
        authorize @bike
    end

    def update
        @bike = Bike.find(params[:id])
        authorize @bike
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
        authorize @bike
        if @bike.save
            redirect_to @bike, notice: 'Bike was added'
        else
            render :new, notice: 'Bike was not added'
        end

    end

    def show
        @bike = Bike.find(params[:id])
        @bookings = Booking.new
        authorize @bike

    end

    def destroy
        @bike = Bike.find(params[:id])
        @bike.destroy
        authorize @bike
        redirect_to bikes_path
    end


    private

    def bike_params
        params.require(:bike).permit(:title, :photo, :description, :district_id,:category)
    end
end
