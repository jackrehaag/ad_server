Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :advertisers do
  	resources :campaigns, except: :index
  end

  resources :users, except: [:new, :create]
  resources :campaigns, only: :index

  namespace :api do
  	get 'campaigns', to: 'campaigns#index'
	  get 'campaigns/active', to: 'campaigns#active'
	  get ':country/campaigns/', to: 'campaigns#index'
	  get ':country/campaigns/active', to: 'campaigns#active'
  end
end