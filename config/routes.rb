Rails.application.routes.draw do
  resources :order_items
  resources :carts
  get 'sessions/new'
  get 'home/index'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :products
  resources :users

  root to: 'home#index', as: 'home'
end
