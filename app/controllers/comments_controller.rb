class CommentsController < ApplicationController

  def new
  end

  def create
    comment = Comment.create(comment_params)
    @event = Event.find_by(id: params[:comment][:event_id])
    redirect_to user_event_path(@event.user, @event)
  end

  def destroy
  end

private

  def comment_params
  params.require(:comment).permit(
    :content,
    :user_id,
    :event_id)
  end
end
