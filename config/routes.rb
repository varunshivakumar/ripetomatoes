Rails.application.routes.draw do
  root 'visitors#index'
  get 'genre', to: 'visitors#genre', as: 'genre'

  devise_for :users
  resources :users
end
