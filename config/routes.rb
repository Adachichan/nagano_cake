Rails.application.routes.draw do

  #---------------------------------------------------------------------------------------
  # public routes

  scope module: :public do
    # home
    root to: 'homes#top'
    get 'about', to: 'homes#about', as: 'about'

    # item
    resources :items, only: [:index, :show]

    # customer
    get 'customers/my_page', to: 'customers#show', as: 'public_customer_show'
    get 'customers/information/edit', to: 'customers#edit', as: 'public_customer_edit'
    patch 'customers/information', to: 'customers#update', as: 'public_customer_update'
    get 'customers/confirm', to: 'customers#confirm', as: 'public_customer_confirm'
    patch 'customers/withdraw', to: 'customers#withdraw', as: 'public_customer_withdraw'

    # cart_item
    delete 'cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]

    # order
    post 'orders/confirm', to: 'orders#confirm', as: 'confirm_order'
    get 'orders/complete', to: 'orders#complete', as: 'complete_order'
    resources :orders, only: [:new, :create, :index, :show]

    # delivery_address
    resources :delivery_addresses, only: [:index, :create, :destroy, :edit, :update]

  end

  # URL：/customers/sign_in
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #---------------------------------------------------------------------------------------
  # admin routes

  # URL：/admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    # home
    root to: 'homes#top'

    # item
    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    # customer
    resources :customers, only: [:index, :show, :edit, :update]

    # order
    resources :orders, only: [:show, :update]

    # order_item
    resources :order_items, only: [:update]

    # genre
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
