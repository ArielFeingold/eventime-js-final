class RsvpsController < ApplicationController

  def create
    @event = Event.find_by(id: params[:event_id])
    rsvp = Rsvp.new
    rsvp.user_id = current_user.id
    rsvp.event_id = params[:event_id]
    rsvp.save
    redirect_to user_event_path(@event.user, @event)
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    rsvp = Rsvp.find_by(user_id: current_user, event_id: params[:id])
    rsvp.destroy
    redirect_to user_event_path(@event.user, @event)
  end

  def index
    @rsvps = Rsvp.all
    respond_to do |format|
       format.json { render json: @rsvps }
    end
  end

end
