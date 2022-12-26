Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdrawal'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
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
