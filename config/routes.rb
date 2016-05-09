Rails.application.routes.draw do

root 'home#index'
get '/users/new', to: 'users#new', as: 'sign_up'
get 'signin', to: 'sessions#new', as: 'sign_in'
get 'logout', to: 'sessions#destroy'

  resources :sessions
  resources :rides

  resources :users

  resources :attractions

end