Messiyah::Application.routes.draw do
  resources :messages do
  	post :reply
  end

  devise_for :users, controllers: { :registrations => "users/registrations", :sessions => "users/sessions"}
  devise_for :customers, :controllers => { :registrations => "customers/registrations", :sessions => "customers/sessions", :omniauth_callbacks => "customers/omniauth_callbacks"  }
  get "searchs/index"
  get "maps/index"
  resources :posts

  root  'about#index'
  match '/about', to:'about#index', via:'get'
end