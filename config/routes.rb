Rails.application.routes.draw do

  get '/signin', to: 'sessions#new'
  delete '/logout' => 'sessions#destroy'

  root 'application#welcome'

  resources :users, :attractions 
  resources :rides, only: [:index, :create]
  resources :sessions, only: [:new, :create, :destroy]

end