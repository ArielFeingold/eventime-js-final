class EventsController < ApplicationController

  def new
    @event = Event.new
    @event.build_location
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to event_path(@event)
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
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

private

  # def rsvp?
  #   self
  # end

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
    ],
    rsvp_attributes: [:user_id])
  end
end
