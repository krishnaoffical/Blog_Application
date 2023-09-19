Rails.application.routes.draw do
  resources :tags
  root 'topics#index'
  resources :posts
  # get '/posts',to: 'posts#all_posts',as: 'all_posts'
  resources :topics do
    resources :posts do
      resources :comments
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
