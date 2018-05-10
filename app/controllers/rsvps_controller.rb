class RsvpsController < ApplicationController

  def create
    @event = Event.find_by(id: params[:event_id])
    rsvp = Rsvp.new
    rsvp.user_id = current_user.id
    rsvp.event_id = params[:event_id]
    rsvp.save
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    rsvp = Rsvp.find_by(user_id: current_user, event_id: params[:id])
    rsvp.destroy
    binding.pry
    redirect_to event_path(@event)
  end

end
