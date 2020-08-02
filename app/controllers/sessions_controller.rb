class SessionsController < ApplicationController
  # Helpers
  before_action :authenticate_user!, only: [:destroy]

  def new
    if logged_in?
      redirect_to projects_path
    else
      redirect_to new_user_session
    end
  end

  def create
    if auth_hash = request.env['omniauth.auth']
      # Logged in via OAuth
      user = User.find_or_create_by_omniauth(auth_hash)
      user_session
      redirect_to projects_path
    else
      user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          user_session
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
      destroy_user_session
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def omniauth
    @user = User.create_by_google_omniauth(auth)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end

  end

  private
  def auth
    request.env['omniauth.auth']
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end