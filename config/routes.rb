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

  # Nested Resources - teams/projects

    resources :teams do
      resources :projects
      resources :lists
    end


end
