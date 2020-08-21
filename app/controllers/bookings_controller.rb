class BookingsController < ApplicationController
    def new
        @Bike = Bike.find(:id)
        @booking = Booking.new
        authorize @booking
        @booking.bike = @Bike
    end

    def create
        @booking = Booking.new(bookings_params)
        @bike = Bike.find(params[:bike_id])
        @user = User.find(current_user.id)
        @booking.bike = @bike
        @booking.user = @user
        @booking.confirmation_status = "pending"
        authorize @booking
        if @booking.save
            redirect_to bike_path(@bike), notice: 'Booking was requested.'
        else
            redirect_to bike_path(@bike), notice: 'Booking request has failed.'

        end
    end

    def update
        @booking = Booking.find(params[:id])
        if @booking.update(bookings_params)
          redirect_to @booking, notice: 'Booking was successfully updated.'
        else
          render :edit
        end
      end
        
    def show
        @user = User.find(current_user.id)
        @booking = Bookings.all
        authorize @booking
        
    end

    def index
        @user = User.find(current_user.id)
        @my_booking = policy_scope(Booking).where(user_id: @user.id)
      ## leaving this out because it breaks stuff
       @booking = policy_scope(Booking).joins(:bike).where("bikes.user_id = #{@user.id}")
    end

    def edit
        @booking = Booking.find(params[:id])
        redirect_back(fallback_location: root_path)
    end

    def confirm
        @booking = Booking.find(params[:id])
        @booking.confirmation_status = "Confirmed"
    end

    def reject
        @booking = Booking.find(params[:id])
        @booking.confirmation_status = "Confirmed"
    end

 private
    def bookings_params
        params.require(:booking).permit(:starting_date, :end_date, :id)
    end

    
    
end
