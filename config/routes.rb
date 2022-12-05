Rails.application.routes.draw do
  get 'search_item/index'
  get 'search_item/create'
  get 'user/index'
  get 'user/show'
  get 'user/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
