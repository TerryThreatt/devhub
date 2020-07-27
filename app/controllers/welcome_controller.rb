class WelcomeController < ApplicationController
  def home
    if user_signed_in?
      # @teams = current_user.teams
      # @projects = current_user.projects
      @teams = Team.where(id: current_user.id)
  		@projects = Project.where(team_id: current_user.id)
    end
  end
end
