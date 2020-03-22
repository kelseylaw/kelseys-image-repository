Rails.application.routes.draw do
  root 'pages#home'
  resources :images
  resources :users
  get 'register', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
