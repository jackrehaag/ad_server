Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :advertisers do
  	resources :campaigns
  end
  resources :users, except: [:new, :create]
end