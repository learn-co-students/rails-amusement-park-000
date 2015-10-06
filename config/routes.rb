Rails.application.routes.draw do


  root 'welcome#show'
  resources :users

  # get 'users/new' => 'users#new'
  get 'signin' => 'users#index', :as => 'signin'
  post 'users/test' => 'sessions#new', :as => 'test'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  put 'take_ride' => 'users#update'
 


  resources :sessions
  resources :attractions

end