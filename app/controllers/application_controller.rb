class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user_is_authenticated
  helper_method :current_user

  private
  def verify_user_is_authenticated
    unless user_is_authenticated
      flash[:notice] = "You need to be logged in to access the site."
      redirect_to '/'
    end
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id:session[:user_id])
  end
end
