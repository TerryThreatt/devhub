Rails.application.routes.draw do

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
  get '/auth/github/callback', to: 'sessions#create'

  # Nested Resources - Projects/ProjectTasks

    resources :projects do
      resources :project_tasks, except: [:update, :destroy]
    end


  #Shallow
  resources :project_tasks, only: [:update, :destroy]

  # Tasks
  resources :tasks

end
