Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/logout'
  root to: 'home#index'

  resources :user, only: [:new, :create]
  post :login, to: 'user#login'
  delete :logout, to: "user#logout"
  resources :search_items, only: [:index, :new, :create]
end
