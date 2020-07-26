Rails.application.routes.draw do
  # Homepage
  root 'welcome#home'

  # Users
  devise_for :users
  resources :users, except: [:new]
  get '/signup', to: 'users#new'

  # Sessions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Third Party Signup
  # get '/auth/github/callback', to: 'sessions#create', as: :github

  # Nested Resources - Projects/ProjectTasks

    resources :teams do
      resources :projects, except: [:update, :destroy] do
        resources :tasks, except: [:update, :destroy]
      end
    end

  #Shallow
  resources :projects, only: [:update, :destroy]
  resources :tasks, only: [:update, :destroy]

end
