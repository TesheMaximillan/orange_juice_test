Rails.application.routes.draw do
  root to: 'user#login', as: 'login'
  resources :user, only: [:new, :create]
  delete :logout, to: "user#logout"
  if :user
    resources :search_items, only: [:index, :create]
  end
end
