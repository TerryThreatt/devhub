class TasksController < ApplicationController
  # Helpers
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.all
  end


  def new
    @task = Task.new
    @user = current_user
  end

  def create
    @task = current_user.tasks.new(task_params)

    if @task.save
      redirect_to task_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update

    if @task.update(task_params)
      redirect_to @task, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @project = Project.find_by(id: params[:project_id])
    @task.destroy
    redirect_to project_path(@user, @project), notice: 'Task was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description)
    end
end
