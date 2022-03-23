Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/bookings/profile', to: 'bookings#profile', as: 'profile'
  get '/dresses/favorites', to: 'dresses#favorites', as: 'favorites'
  get 'dresses/listings', to: 'dresses#listings', as: 'listings'
  resources :dresses do
    resources :bookings, only: %i[new create]
    resources :reviews, only: :create
  end
  resources :bookings, only: %i[destroy index update]
  resources :reviews, only: [:destroy]
  get '/dresses/:id/favorite', to: 'dresses#favorite', as: 'favorite'
  resources :articles
end
