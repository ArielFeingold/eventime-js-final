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
    @location = Location.new(location_params)
    if @location.save
      redirect_to user_location_path(@location.user, @location)
    else
      render 'new'
    end
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

  def location_params
  params.require(:location).permit(
      :name,
      :address,
      :city,
      :state,
      :public,
      :user_id
      )
  end

end
