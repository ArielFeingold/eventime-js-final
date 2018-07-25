class UsersController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
	     redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @user }
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :name,
      :about,
      :city,
      :state
      )
    end

  def attending(user)
    Event.all.find_all {|e| e.users.include? user}
  end

  def user_events
    Event.all.find_all {|event| event.user_id == params[:id].to_i}
  end

  def events_near_by
    Event.all.find_all {|event| event.location.city.downcase == current_user.city.downcase && event.location.state == current_user.state}
  end
end
