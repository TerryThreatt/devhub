class UsersController < ApplicationController
  # Lifecyle Hooks
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    # @teams = User.find(params[id]).projects.users
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
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
