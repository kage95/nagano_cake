Rails.application.routes.draw do
  root to: "homes#top"
  get "/admin" => "homes#top"
  get "homes/about"=> "homes#about",as:"about"
  
  namespace :admin do
    resources :genres
    resources :items
  end
  
  devise_for :admin,skip: [:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }
  
  get "customers/my_page" => "public/customers#show",as:"my_page"
  get "customers/unsubscribe" => "public/customers#unsubscribe",as:"unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw",as:"withdraw"
  
  scope module: :public do
    resource :customers
  end
  
  devise_for :customers,skip: [:passwords,],controllers:{
     registrations: "public/registrations",
     sessions: "public/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
