Rails.application.routes.draw do
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
  resources :posts
end
