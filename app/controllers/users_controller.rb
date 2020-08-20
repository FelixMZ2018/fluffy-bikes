class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bikes = Bike.where(user_id: @user.id)
    authorize @user
  end
end
