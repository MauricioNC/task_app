Rails.application.routes.draw do
  resources :users, only:     [:new, :create]
  resources :entities, only:  [:new, :create, :show, :update, :edit, :destroy]
  resources :tasks, only:     [:new, :create, :update, :edit, :destroy]
  
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
  post 'entities/:id', to: 'entities#update'
  delete 'entities/:id', to: 'entities#destroy' 

  #======================#
  #==== TASKS ROUTES ====#
  #======================#
  get 'tasks/new/:id', to: 'tasks#new'
  get 'tasks/create', to: 'tasks#create'
  get 'tasks/:id', to: 'tasks#edit'
  put 'tasks/:id/:status', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'

#=========================#
#==== SEARCHER ROUTES ====#
#=========================#
get '/search', to: 'searcher#search'

end
