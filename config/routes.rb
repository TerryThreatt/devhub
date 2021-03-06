Rails.application.routes.draw do

  # Homepage
  root 'welcome#home'

  # Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Nested Resources - users/projects
  resources :users, only: [:show] do
    resources :projects do
      resources :project_tasks
    end
  end

  # Task
  resources :tasks

  # Scope
  get '/project_tasks/recent', to: 'project_tasks#recent'

  get '/users/:id/project_tasks', to: 'project_tasks#user_project_tasks', as: :user_project_tasks

end
