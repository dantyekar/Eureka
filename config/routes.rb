Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/index'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :administrator do
    resources :users, only: [:index, :destroy]
    resources :products
    resources :orders, only: [:index]
  end
  get 'administrator' => 'administrator/base#index', as: :dashboard

  resources :carts, only: [:show, :destroy]
  resources :order_items
  resources :users
  resources :orders

  root to: 'home#index', as: 'home'
end
