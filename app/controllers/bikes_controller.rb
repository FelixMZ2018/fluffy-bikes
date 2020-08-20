class BikesController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :index ]
    before_action :set_district, only: [ :create ]
    before_action :set_categories, only: [ :new, :edit ]

    def new
        @user = User.find(current_user.id)
        @bike = Bike.new
        @districts = District.all
        authorize @bike
    end

    def index
        @bikes = policy_scope(Bike).order(created_at: :desc)
        @bikes = @bikes.search_by_title_and_description(params[:query]) if params[:query].present?
        @bikes = Bike.where('category ILIKE ?', "%#{params[:category]}%") if params[:category].present?
      if params[:district].present?
        district = District.find_by_name(params[:district])
        @bikes = Bike.where(district_id: district.id)
      end
    end

    def edit
        @bike = Bike.find(params[:id])
        @user = User.find(current_user.id)
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
        @bike.district = @district
        @user = User.find(current_user.id)
        @bike.user = @user
        authorize @bike
        if @bike.save
            redirect_to @bike, notice: 'Bike was added'
        else
            render :new
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
        params.require(:bike).permit(:title, :photo, :description, :district_id, :category)

    end

    def set_district
      @district = District.find(params[:bike][:district_id])
    end

    def set_categories
      @categories = ["eBike", "City Bike"]
    end
end
