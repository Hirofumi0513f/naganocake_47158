Rails.application.routes.draw do
    devise_for:customers,skip: [:passwords],controllers:{
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    devise_for:admin,skip: [:registrations, :passwords],controllers:{
      sessions: "admin/sessions"
    }


  root to: "public/homes#top"
  get '/about', to: "public/homes#about", as: "about"

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    delete '/cart_items/destroy_all',to:"cart_items#destroy_all", as: "destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]

    resource :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
    get '/customers/unsubscribe',to:"customers#unsubscribe", as: "unsubscribe"
    patch '/customers/withdrawal',to:"customers#withdrawal", as: "withdrawal"

    resources :items, only: [:index, :show]


    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm' , to: "orders#confirm", as: "confirm"
    get  '/orders/complete/:id', to: "orders#complete", as: "complete"
  end


  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :order_details, only: [:update]
    resources :orders, only: [:show, :update]
    #resources :sessions, only: [:new, :create, :destroy]

  end


end
