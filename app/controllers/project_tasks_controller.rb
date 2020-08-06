class ProjectTasksController < ApplicationController
  # Helpers
  before_action :set_project_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @project_tasks = ProjectTask.all
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
  end

  def new
    @project_task = ProjectTask.new
    @project = Project.find_by(id: params[:project_id])
    @task = @project_task.build_task
    @user = current_user
  end

  def create
    @project_task = ProjectTask.new(project_task_params)
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
    if @project_task.save
      redirect_to user_project_project_tasks_path(@user, @project, @project_task), notice: 'Project Task was successfully created.'
    else
      render :new
    end
  end

  def show
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
  end

  def edit
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
  end

  def update
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
    if @project_task.update(project_task_params)
      redirect_to user_project_project_task_path(@user, @project, @project_task), notice: 'Project Task was successfully updated.'
   else
      render :edit
   end
  end

  def destroy
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
    @project_task.destroy
    redirect_to user_projects_path(@user, @project), notice: 'Project Task was successfully destroyed.'
  end

  def recent
    @recent = ProjectTask.recent
  end

  private # This encapsulates these methods

  # Strong params
    def set_project_task
      @project_task = ProjectTask.find_by(id: params[:id])
    end

    def project_task_params
      params.require(:project_task).permit(:id, :name, :description, :due_date, :user_id, :project_id, user_attributes: [:id, :email ], task_attributes: [:id, :name, :description, :users], project_attributes: [:id, :name ] )
    end
end
