Messiyah::Application.routes.draw do
  resources :posts

  root  'posts#index'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/about', to:'about#index', via:'get'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end