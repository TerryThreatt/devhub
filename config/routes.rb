Rails.application.routes.draw do

  # Homepage
  root 'welcome#home'

  # Users
  devise_for :users
  # resources :users, except: [:new]
  # get '/signup', to: 'users#new'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Nested Resources - projects/project_tasks
  resources :projects do
    resources :project_tasks
  end

  # Task
  resources :tasks

end
