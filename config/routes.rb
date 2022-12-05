Rails.application.routes.draw do
  root to: 'home#index'

  resources :user, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete :logout, to: "sessions#logout"
  resources :search_items, only: [:index, :new, :create]
end
