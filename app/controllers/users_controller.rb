class UsersController < ApplicationController
  # Helpers
  helper_method :logged_in?, :current_user

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user

    if logged_in?
      if @user == User.find_by(id: params[:id])
        redirect_to projects_path
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


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to DevHub!"
      redirect_to projects_path
    else
      flash[:err] = "Please try again."
      render :new
    end
  end

  private # This encapsulates these methods

  # Strong params - Prevents
  def user_params
    params.require(:user).permit(:username, :email, :password, :admin?)
  end

end
