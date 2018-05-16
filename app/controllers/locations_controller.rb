class LocationsController < ApplicationController

  def show
    @location = Location.find(params[:id])
    @upcoming_events = upcoming_events(@location)
  end

  def index
    @public_locations_nearby = Location.public_locations.nearby(current_user.city, current_user.state)
    @user_locations = Location.belong_to_user(current_user)
  end

  def new
    @location = Location.new
  end

  def create
    binding.pry
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def upcoming_events(location)
    location.events.find_all {|event| event.date > Date.today}
  end

end
