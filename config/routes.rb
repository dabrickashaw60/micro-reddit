Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  root 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
