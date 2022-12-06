Rails.application.routes.draw do
  root to: 'home#index'

  resources :user, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete :logout, to: "sessions#logout"
  post :search_items, to: "search_items#create"
  get :search_items, to: "search_items#new"
end
