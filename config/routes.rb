Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/posts/searchcategory',  to: 'posts#search_category'
  resources :posts do
    collection do
      get 'search'
    end
    # resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show
  # resources :users, only: :show do
    # get :favorites, on: :collection
    # resource :relationships, only: [:create, :destroy]
    # get :users, on: :member
    # get :follows, on: :member
    # get :follows, on: :member
    # get :followers, on: :member
  # end
  # resources :relationships, only: [:create, :destroy]
end
