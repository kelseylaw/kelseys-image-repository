Rails.application.routes.draw do
  root 'pages#home'
  
  resources :images
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'register', to: 'users#new'
  get 'users', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'profile', to: 'users#show'
end
