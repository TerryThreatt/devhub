class TasksController < ApplicationController
  # Helpers
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = current_user.projects.tasks.build
    @teams = Team.where('id = ?', current_user.team_id)
    @project = Project.where('id = ?', current_user.project_id)
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @projects = current_user.projects
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
   else
      render :edit
   end
  end

  def destroy
    @task.destroy
    redirect_to team_project_tasks_path, notice: 'Task was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description, , :priority, :due_date, , :user_id, :team_id, :project_id)
    end
end
