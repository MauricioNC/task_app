Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :entities, only: [:new, :create, :show, :update, :edit, :destroy]
  resources :tasks, only: [:new, :create]
  
  root 'entities#index'
  
  #=====================#
  #==== USER ROUTES ====#
  #=====================#
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  
  #=========================#
  #==== ENTITIES ROUTES ====#
  #=========================#
  get 'entities/new', to: 'entities#new'
  post 'entities/create', to: 'entities#create'
  get 'entities/:id', to: 'entities#show'
  put 'entities/:id', to: 'entities#edit'
  put 'entities/:id', to: 'entities#update'

  #======================#
  #==== TASKS ROUTES ====#
  #======================#
  get 'tasks/new/:id', to: 'tasks#new'
  get 'tasks/create', to: 'tasks#create'

end
