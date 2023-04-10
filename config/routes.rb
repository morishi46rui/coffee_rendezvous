Rails.application.routes.draw do
  get 'categories/index'
  resources :shops do
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users
  resources :users, only: [:show]
  root 'homes#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
