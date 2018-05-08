class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  def new
   @user = User.new
 end

 def create
   if auth
     sign_in_with_auth(auth)
   else
     sign_in_with_password
   end
  end


 def destroy
   session.delete :user_id
   redirect_to root_path
 end

private

   def auth
    request.env['omniauth.auth']
  end

  def sign_in_with_auth(auth)
    if User.find_by(uid: auth['uid']).present?
      @user = User.find_by(uid: auth['uid'])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.create(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = 'asdfgasgadfgsdfhscnbq345'
      end
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)
    end
  end

  def sign_in_with_password
    @user = User.find_by(email: params[:user][:email])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end
