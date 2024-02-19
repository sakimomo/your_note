Rails.application.routes.draw do
  devise_for :users
  root to: "notes#index"
  
  resources :notes do
    resources :comments, only: [:create]
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search', to: 'notes#search'
    end
  end
  
  resources :users, only: [:show] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  
  get '/likes/index', to: 'likes#index', as: :likes_index
end