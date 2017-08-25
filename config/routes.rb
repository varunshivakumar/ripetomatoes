Rails.application.routes.draw do
  root 'visitors#index'
  get 'visitors#latest'

  devise_for :users
  resources :users
end
