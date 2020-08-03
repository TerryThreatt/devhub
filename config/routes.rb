Rails.application.routes.draw do

  # Homepage
  root 'welcome#home'

  # Devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Nested Resources - users/projects
  resources :users, only: [:show] do
    resources :projects do
      resources :project_tasks, except: [:edit, :update, :destroy]
    end
  end

  # Project Tasks
  resources :project_tasks, only: [:edit, :update, :destroy]

  # Task
  resources :tasks

end
