Messiyah::Application.routes.draw do
  get "searchs/index"
  get "maps/index"
  resources :posts

  root  'about#index'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/about', to:'about#index', via:'get'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end