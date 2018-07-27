class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    render json: @post, status: 201
  end

  def create
    comment = Comment.create(comment_params)
    render json: comment, status: 201
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
