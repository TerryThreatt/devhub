Rails.application.routes.draw do

  # Homepage
  root 'welcome#home'

  # Users
  resources :users

  # Sessions
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/logout'

  # Nested Resources - Projects/ProjectTasks
  resources :projects do
    resources :project_tasks, except: [:update, :destroy]
  end

  #Shallow
  resources :project_tasks, only: [:update, :destroy]

  # Tasks
  resources :tasks

end
