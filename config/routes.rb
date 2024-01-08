Rails.application.routes.draw do
  devise_for :users
  resources :tags
  root 'topics#index'
  get 'posts',to:'posts#index'
  resources :topics do
    resources :posts do
      member do
        get 'read_status'
      end
      resources :comments do
        resources :user_comment_ratings,only: [:create, :index]
    end
      resources :ratings
    end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
