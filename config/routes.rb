Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :genres, only: :show
  authenticated :user do 
    root "items#index", as: "authenticated_root"
  end 

  get 'welcomes/about_me'
  root "welcomes#about_me"

  namespace :admin do 
    resources :genres
    root "genre#index"
  end

end
