class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.build_location
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

  def index
  end

  def show
  end

  def event_params
  params.require(:event).permit(
    :title,
    :date,
    :time,
    :description,
    :user_id,
    location_attributes: [
      :name,
      :address,
      :city,
      :state,
    ]
  )
end

end
