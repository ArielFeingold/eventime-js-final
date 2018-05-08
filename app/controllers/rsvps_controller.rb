class RsvpsController < ApplicationController

  def create
    rsvp = Rsvp.new
    rsvp.user_id = current_user.id
    rsvp.event_id = params[:event_id]
    rsvp.save
    binding.pry
    redirect_to user_path(current_user)
  end

  def update
    if @rsvp.update_attributes rsvp_params
      redirect_to user_path(current_user)
    end
  end
end
