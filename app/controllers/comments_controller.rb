class CommentsController < ApplicationController

  def new
    binding.pry
    @comment = Comment.new
  end

  def create
  end

  def destroy
  end
end
