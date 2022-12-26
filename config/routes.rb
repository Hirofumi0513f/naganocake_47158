Rails.application.routes.draw do
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :homes, only: [:top]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
