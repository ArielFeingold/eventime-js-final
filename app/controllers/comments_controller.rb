class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    @event = Event.find_by(id: params[:comment][:event_id])
    redirect_to user_event_path(@event.user, @event)
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to user_event_path(@comment.user, @comment.event)
    else
      render 'edit'
    end
  end

private

  def comment_params
  params.require(:comment).permit(
    :content,
    :user_id,
    :event_id)
  end
end
