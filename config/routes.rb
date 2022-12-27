Rails.application.routes.draw do
  root to: "public/homes#top"
  get '/home/about', to: "public/homes#about", as: "about"
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  

  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end

end
