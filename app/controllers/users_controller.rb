class UsersController < ApplicationController
  # Helpers
  before_action :set_user, only: [:show ]
  before_action :authenticate_user!, only: [:show]


  def show

    if user_signed_in?
      if @user == User.find_by(id: params[:id])
        redirect_to team_projects_path, note: "Welcome to DevHub!"
      else
        redirect_to root_path, danger: "Sorry, You don't have access to this page."
      end
    else
      redirect_to login_path, err: "Please login."
    end
  end

  def new
    if user_signed_in?
      redirect_to team_projects_path
    else
      @user = User.new
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to team_projects_path, note: "Welcome to DevHub!"
    else
      render :new, err: "Please try again."
    end
  end

  private # This encapsulates these methods

  # Strong params
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
