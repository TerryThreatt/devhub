class ProjectsController < ApplicationController
  # Helpers
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
    @user = current_user
  end

  def new
    @project = Project.new
    @user = current_user
  end

  def create
    @project = Project.new(project_params)
    @user = current_user

    if @project.save
      redirect_to user_project_path(@user, @project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @project.update(project_params)
       redirect_to user_project_path(@user, @project), notice: 'Project was successfully updated.'
    else
       render :edit
    end
  end

  def destroy
    @user = current_user
    @project.destroy
    redirect_to user_projects_path(@user), notice: 'Project was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_project
      @project = Project.find_by(id: params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_date, :id, :user_id)
    end
end
