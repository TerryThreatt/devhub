class SessionsController < ApplicationController
  # Helpers
  helper_method :logged_in?, :current_user

  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = "Please Try again!"
      render :new
    end
  end

  def destroy
    if logged_in?
      session.clear
      redirect_to '/'
    else
      redirect_to root_path 
  end
end
