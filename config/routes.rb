Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :dresses do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[new create]
  end
  resources :bookings, only: %i[destroy index update]
  resources :reviews, only: [:destroy]
  get '/profile', to: 'pages#profile'
end
