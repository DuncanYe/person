Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items do
    resources :comments, only: [:create, :destroy]
    resources :registers, only: [:create, :destroy]

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

  namespace :admin, path: :abcdefg_make_backend_abstruse do 
    resources :genres
    resources :items, only: [:index]
    resources :users, only: [:index, :edit, :update, :destroy]
    root "users#index"
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
