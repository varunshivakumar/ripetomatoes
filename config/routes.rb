Rails.application.routes.draw do
  root 'visitors#index'
  get 'genre', to: 'visitors#genre', as: 'genre'
  get 'movie/:id', to: 'movies#show', as: 'movie'

  devise_for :users
  resources :users
end
