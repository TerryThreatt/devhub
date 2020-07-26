class ProjectsController < ApplicationController
  # Helpers
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.build
    @teams = Team.where('id = ?', current_user.team_id)
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @teams = current_user.teams
  end

  def update
    if @project.update(project_params)
       redirect_to @project, notice: 'Project was successfully updated.'
    else
       render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to team_projects_path, notice: 'Project was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_date, :user_id, :team_id)
    end
end
