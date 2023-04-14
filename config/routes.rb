Rails.application.routes.draw do
  resources :shops do
    resources :bookmarks, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  devise_for :users
  resources :users, only: [:show]
  post '/guest_sign_in', to: 'guest_sessions#create'
  root 'homes#index'
end
