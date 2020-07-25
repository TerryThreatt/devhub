class ProjectsController < ApplicationController
  # cancancan authorization macro
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @user = current_user
    @project = @user.projects.build(project_params)

    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private # This encapsulates these methods

  # Strong params
  def project_params
    params.require(:project).permit(:name, :description, :due_date)
  end

end
