Rails.application.routes.draw do
  root to: "homes#top"
  get "/admin" => "homes#top"
  get "homes/about"=> "homes#about",as:"about"
  
  get "admin/searches/search" => "admin/searches#search",as:"admin_search"
  get "admin/searches/genre_search" => "admin/searches#genre_search",as:"admin_genre_search"
  
  namespace :admin do
    resources :genres,only: [:index,:create,:edit,:update]
    resources :items,except: [:destroy]
    resources :customers,only: [:index,:edit,:update,:show]
    resources :orders,only:[:show,:update,:index]
    resources :order_details,only:[:update]
  end
  
  devise_for :admin,skip: [:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }
  
  get "customers/my_page" => "public/customers#show",as:"my_page"
  get "customers/unsubscribe" => "public/customers#unsubscribe",as:"unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw",as:"withdraw"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all",as:"destroy_all"
  get "orders/complete" => "public/orders#complete",as:"complete"
  post "orders/confirm" => "public/orders#confirm",as:"confirm"
  get "searches/search" => "public/searches#search",as:"search"
  get "searches/genre_search" => "public/searches#genre_search",as:"genre_search"
  
  scope module: :public do
    resource :customers,except: [:new,:create]
    resources :addresses,except: [:show,:new]
    resources :items,only:[:index,:show]
    resources :cart_items,only:[:index,:create,:update,:destroy]
    resources :orders,only:[:index,:new,:create,:show]
  end
  
  devise_for :customers,skip: [:passwords,],controllers:{
     registrations: "public/registrations",
     sessions: "public/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
