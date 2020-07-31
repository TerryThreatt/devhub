class ProjectTasksController < ApplicationController
  # Helpers
  before_action :set_project_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @project_tasks = ProjectTask.all
  end

  def new
    @project_task = current_user.project_tasks.build
  end

  def create
    @project_task = current_user.project_task.build(project_task_params)

    if @project_task.save
      redirect_to @project_task, notice: 'Project Task was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project_task.update(project_task_params)
      redirect_to @project_task, notice: 'Project Task was successfully updated.'
   else
      render :edit
   end
  end

  def destroy
    @project_task.destroy
    redirect_to project_project_tasks_path, notice: 'Project Task was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_project_task
      @project_task = ProjectTask.find(params[:id])
    end

    def project_task_params
      params.require(:project_task).permit(:name, :description, :due_date, tasks_attributes: [:id, :name], users_attributes: [:id, :email ] )
    end
end
