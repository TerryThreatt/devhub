class ListsController < ApplicationController
  # Helpers
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
  end

  def create
    @list = current_user.lists.new(task_params)
    @list.user_id = current_user.id

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
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
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
   else
      render :edit
   end
  end

  def destroy
    @list.destroy
    redirect_to team_project_list_path, notice: 'Task was successfully destroyed.'
  end

  private # This encapsulates these methods

  # Strong params
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :description, :due_date, , :user_id, :team_id, :project_id)
    end
end
