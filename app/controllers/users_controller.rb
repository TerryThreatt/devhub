class UsersController < ApplicationController
  # Lifecyle Hooks
  before_action :set_user, only: [:edit, :update, :destroy]
  # Helpers
  helper_method :logged_in?, :current_user

  def index
    @users = User.all
    @user = current_user
    # @teams = User.find(params[id]).projects.users
  end

  def show
    @user = current_user

    if logged_in?
      if @user == User.find_by(id: params[:id])
        render :layout => "application"
      else
        flash[:danger] = "Sorry, You don't have access to this page."
        redirect_to root_path
      end
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in?
      redirect_to projects_path
    else
      @user = User.new
    end
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private # This encapsulates these methods

  # Strong params - Prevents
  def user_params
    params.require(:user).permit(:username, :email, :password, :admin?)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
