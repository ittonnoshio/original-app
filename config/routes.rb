Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
