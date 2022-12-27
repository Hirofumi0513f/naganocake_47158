Rails.application.routes.draw do
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :homes, only: [:top, :about]
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :sessions, only: [:new, :create, :destroy]
      devise_for :admins
  end



end
