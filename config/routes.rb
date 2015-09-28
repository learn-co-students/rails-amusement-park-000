Rails.application.routes.draw do

resources :users

resources :attractions

resources :sessions

root 'users#index'

get '/signin', to: "sessions#new"

delete '/logout', to: "sessions#destroy", as: "logout"

post '/riding/:id', to: "attractions#riding", as: "riding"

end