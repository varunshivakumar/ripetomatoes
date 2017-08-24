Rails.application.routes.draw do
  root 'visitors#index'

  devise_for :users
  resources :users
end
