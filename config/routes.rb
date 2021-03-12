Rails.application.routes.draw do
  devise_for :users
  root to: "experiences#index"
  
  resources :experiences
  resources :users, only: [:show,:edit,:update]
  resources :messages, only: [:new, :create]
  resources :rooms, only: [:create, :show]
  
  # resources :rooms, only: [:index, :new, :create]

end
