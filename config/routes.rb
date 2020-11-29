Rails.application.routes.draw do
  # resources :comments
  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
  end

  authenticated :user do
    root to: 'posts#index'
  end

  devise_for :users

  resources :users
  resources :friendships, only: %i[create destroy]
  resources :posts
  resources :comments do
    resources :likes, only: %i[create destroy]
  end
end
