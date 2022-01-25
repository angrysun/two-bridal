Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :dresses do
    resources :bookings, only: %i[new create edit update] do
    end
    resources :reviews, only: [:new, :create]
  end
    resources :bookings, only: [:destroy] do
  end
    resources :reviews, only: [:destroy]
end
