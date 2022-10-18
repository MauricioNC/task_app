Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :entities, only: [:new, :create, :show, :update, :destroy]
  
  root 'entities#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

  get 'entities/new', to: 'entities#new'
  post 'entities/create', to: 'entities#create'
end
