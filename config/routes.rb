Rails.application.routes.draw do
  root to: 'home#index'

  resources :user, only: [:new, :create]
  post :login, to: 'user#login'
  delete :logout, to: "user#logout"
  if :user
    resources :search_items, only: [:index, :new, :create]
  end
end
