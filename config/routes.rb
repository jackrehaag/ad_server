Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :advertisers
  resources :users, except: [:new, :create]
end