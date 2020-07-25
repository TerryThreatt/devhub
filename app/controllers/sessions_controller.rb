class SessionsController < ApplicationController
  # Helpers
  helper_method :logged_in?, :current_user
  #skip_before_action :verify_authenticity_token, only: :create

  def new
    if logged_in?
      redirect_to projects_path
    end
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      # Logged in via OAuth
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id
      redirect_to projects_path
    else
      user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to projects_path
        else
          flash[:danger] = "Please Try again!"
          render :new
        end
      end
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
