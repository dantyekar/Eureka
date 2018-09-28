Rails.application.routes.draw do
  get 'home/index'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :products
  resources :users

  root to: 'home#index', as: 'home'
end
