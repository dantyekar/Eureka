Rails.application.routes.draw do
  get 'users/new'
  get 'home/index'
  resources :products

  root to: 'home#index', as: 'home'
end
