Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :dresses do
    resources :bookings, only: %i[new create edit update]
  end
  resources :bookings, only: [:destroy]
end
