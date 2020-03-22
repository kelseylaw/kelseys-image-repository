Rails.application.routes.draw do
  resources :images
  resources :users
  root 'pages#home'
  get 'register', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
