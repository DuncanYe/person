Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    resources :comments, only: [:create, :destroy]

    collection do
      get :ranking
    end

    member do
      post :like
      post :unlike
    end

  end
  resources :genres, only: :show
  authenticated :user do 
    root "items#index"
    # heroku 無效
  end 

  get 'welcomes/about_me'
  root "welcomes#about_me"

  namespace :admin do 
    resources :genres
    resources :items
    root "genre#index"
  end

  resources :users, only: [:index, :show, :edit, :update] do 
    member do
      get :comments
      get :followings
      get :liked_items
    end
  end
  resources :followships, only: [:create, :destroy]

end
