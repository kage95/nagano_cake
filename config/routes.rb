Rails.application.routes.draw do
  root to: "homes#top"
  get "/admin" => "homes#top"
  get "homes/about"=> "homes#about",as:"about"
  
  namespace :admin do
    resources :genres,only: [:index,:create,:edit,:update]
    resources :items,except: [:destroy]
    resources :customers,only: [:index,:create,:edit,:update]
  end
  
  devise_for :admin,skip: [:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }
  
  get "customers/my_page" => "public/customers#show",as:"my_page"
  get "customers/unsubscribe" => "public/customers#unsubscribe",as:"unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw",as:"withdraw"
  
  scope module: :public do
    resource :customers,except: [:new,:create]
    resources :addresses,except: [:show,:new]
    resources :items,only:[:index,:show]
  end
  
  devise_for :customers,skip: [:passwords,],controllers:{
     registrations: "public/registrations",
     sessions: "public/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
