Rails.application.routes.draw do
  devise_for :users
  root to: "notes#index"
  
  resources :notes do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
  end
  
  get '/likes/index', to: 'likes#index', as: :likes_index
end