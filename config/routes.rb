Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get '/posts/searchcategory',  to: 'posts#search_category'
  resources :posts, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: :show do
    get :favorites, on: :collection
  end
end
