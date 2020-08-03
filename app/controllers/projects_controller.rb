class ProjectsController < ApplicationController
  # Helpers
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects
    @user = current_user
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
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
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_project
      @project = Project.find_by(id: params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_date, :id, :user_id, :task_id, :project_id)
    end
end
