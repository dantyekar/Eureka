Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/index'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :products
  end

  get 'admin' => 'admin/base#index', as: :dashboard

  resources :users

  root to: 'home#index', as: 'home'
end
