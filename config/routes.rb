Rails.application.routes.draw do
  # Homepage
  root 'welcome#home'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Devise
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}

  # Nested Resources - users/projects
  resources :users do
    resources :projects
  end

  # Project Tasks
  resources :project_tasks

  # Task
  resources :tasks

  # Scope
  get :done, to: 'project_tasks#done'
end
