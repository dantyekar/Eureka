Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/index'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :administrator do
    resources :products
  end

  get 'administrator' => 'administrator/base#index', as: :dashboard

  resources :users, except: :destroy

  root to: 'home#index', as: 'home'
end
