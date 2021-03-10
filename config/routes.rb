Rails.application.routes.draw do
  devise_for :users
  root to: "experiences#index"
  
  resources :experiences do
    resources :deals, only: [:new, :create]
    resources :messages, only: [:new, :create]
  end

  resources :rooms, only: [:index, :new, :create]
  # resources :chats, only: [:new, :create]

end
