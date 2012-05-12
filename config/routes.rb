Rental::Application.routes.draw do
  ActiveAdmin.routes(self)

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :accounts
  #resources :products
  
  match "/thank_you", :to => "accounts#thank_you"
end
