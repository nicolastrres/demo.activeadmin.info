Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "db/seed" => "database#seed"


  get "cart" => "cart#show"
  get "cart/add/:id" => "cart#add", :as => :add_to_cart
  get "cart/remove/:id" => "cart#remove", :as => :remove_from_cart
  post "cart/checkout" => "cart#checkout", :as => :checkout

  get 'signup' => 'users#new', :as => :signup
  get 'logout' => 'sessions#destroy', :as => :logout
  get 'login' => 'sessions#new', :as => :login
  resources :sessions
  resources :users
  resources :products

  root :to => "products#index"
end
