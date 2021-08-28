Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/posts/searchcategory',  to: 'posts#search_category'
  resources :posts do
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show do
    member do
     get :following
    end
  end
  resources :categories, only: :show
  resources :relationships, only: [:create, :destroy]
end
