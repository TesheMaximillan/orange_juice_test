Rails.application.routes.draw do
  root to: 'user#login', as: 'login'
  resources :user, only: [:new, :create]
  delete :logout, to: "user#logout"
  if :user
    get :logged_in, to: "user#logged_in"
  end

end
