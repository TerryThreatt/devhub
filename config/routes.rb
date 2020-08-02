Rails.application.routes.draw do

  # Homepage
  root 'welcome#home'

  # Devise
  devise_for :users
  # Third Party
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  # Nested Resources - users/projects
  resources :users, only: [:show] do
    resources :projects
  end

  # Project Tasks
  resources :project_tasks

  # Task
  resources :tasks

  # Scope
  get :done, to: 'project_tasks#done'
end
