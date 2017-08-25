Rails.application.routes.draw do
  root 'visitors#index'
  get 'latest', to: 'visitors#latest', as: 'latest'

  devise_for :users
  resources :users
end
