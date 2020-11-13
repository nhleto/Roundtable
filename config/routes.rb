Rails.application.routes.draw do
  root to: 'registrations#new'

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users do
    resources :posts
  end
end
