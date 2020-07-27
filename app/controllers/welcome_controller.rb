class WelcomeController < ApplicationController
  def home
    if user_signed_in?
      @teams = current_user.teams
      @projects = current_user.projects
    end
  end
end
