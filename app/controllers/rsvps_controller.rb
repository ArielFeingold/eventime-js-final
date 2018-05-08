class RsvpsController < ApplicationController

  def create
    rsvp = Rsvp.new
    rsvp.user_id = current_user.id
    rsvp.event_id = params[:event_id]
    rsvp.save
    redirect_to user_path(current_user)
  end

  def destroy
    rsvp = Rsvp.find_by(user_id: current_user, event_id: params[:id])
    rsvp.destroy
    redirect_to user_path(current_user)
  end

end
