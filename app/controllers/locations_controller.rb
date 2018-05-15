class LocationsController < ApplicationController

  def show
    @location = Location.find(params[:id])
    @upcoming_events = upcoming_events(@location)
  end


  private

  def upcoming_events(location)
    location.events.find_all {|event| event.date > Date.today}
  end

end
