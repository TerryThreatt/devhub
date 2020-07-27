class TeamsController < ApplicationController
  # Helpers
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = current_user.teams.build
    @user = current_user
    # @team_members = current_user.projects.build_users
  end

  def create
    @team = current_user.teams.build(team_params)

    if @team.save
      redirect_to root_path, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to root_path, notice: 'Team was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description,  users_attributes: [:id, :name, :email, :_destroy])
    end
end
