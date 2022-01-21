Rails.application.routes.draw do
  root to:"homes#top"
  get "homes/about" => "homes#about",as:"about"
  get "/admin" => "homes#top"
  get "homes/about"=> "homes#about",as:"about"
  devise_for :admin,skip: [:registrations, :passwords],controllers:{
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    resources :genres
    resources :items
  end
  
  devise_for :customers,skip: [:passwords,],controllers:{
     registrations: "public/registrations",
     sessions: "public/sessions"
  }
  
  resources :items,only:[:index,:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
