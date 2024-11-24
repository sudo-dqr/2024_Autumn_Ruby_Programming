Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  resources :carts
  resources :favorites
  resources :items
  resources :orders do
    member do
      put :ship
    end
  end
  resources :products
  resources :users
  resources :roles
  resources :cart_products
  resources :favorite_products

  resources :carts do
    resources :cart_products, only: [ :create, :destroy ]
  end

  resources :favorites do
    resources :favorite_products, only: [ :create, :destroy ]
  end

  # 登录和登出
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # 管理员面板
  namespace :admin do
    get "dashboard" => "dashboard#index"
  end
  # 商城主页
  root "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
