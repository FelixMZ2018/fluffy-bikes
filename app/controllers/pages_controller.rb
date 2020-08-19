class PagesController < ApplicationController
  def home
    @bikes = Bike.all
  end
end
