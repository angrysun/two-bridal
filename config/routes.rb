Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/dresses/favorites', to: 'dresses#favorites', as: 'favorites'
  get 'listings', to: 'pages#listings', as: 'listings'
  resources :dresses do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[destroy index update]
  resources :reviews, only: [:destroy]
  get '/profile', to: 'pages#profile'
  get '/dresses/:id/favorite', to: 'dresses#favorite', as: 'favorite'
end
