Rails.application.routes.draw do

  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/create'
  get 'tasks/show'
  get 'tasks/edit'
  get 'tasks/update'
  get 'tasks/destroy'
  get 'projects/index'
  get 'projects/new'
  get 'projects/create'
  get 'projects/show'
  get 'projects/edit'
  get 'projects/update'
  get 'projects/destroy'
  get 'teams/index'
  get 'teams/new'
  get 'teams/create'
  get 'teams/show'
  get 'teams/edit'
  get 'teams/update'
  get 'teams/destroy'
  devise_for :users
  # Homepage
  root 'welcome#home'

  # Users
  resources :users, except: [:new]
  get '/signup', to: 'users#new'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Third Party Signup
  get '/auth/github/callback', to: 'sessions#create', as: :github

  # Nested Resources - Projects/ProjectTasks

    resources :projects do
      resources :project_tasks, except: [:update, :destroy]
    end


  #Shallow
  resources :project_tasks, only: [:update, :destroy]

  # Tasks
  resources :tasks

end
