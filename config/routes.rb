Rails.application.routes.draw do
  devise_for :users
  resources :tags
  root 'topics#index'
  get 'posts',to:'posts#index'
  # resources :posts
  resources :topics do
    resources :posts do
      resources :comments
      resources :ratings
    end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
