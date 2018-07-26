class LocationsController < ApplicationController

  def show
    @location = Location.find_by(id: params[:id])
    session[:location] = @location
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @location }
    end
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
    @location = Location.find_by(id: params[:id])
  end

  def update
    @location = Location.find_by(id: params[:id])
    if @location.update(location_params)
      redirect_to user_location_path(@location.user, @location)
    else
      render 'edit'
    end
  end

  def destroy
    Location.find_by(id: params[:id]).destroy
    redirect_to user_path(current_user)
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
