Rails.application.routes.draw do
  get 'foo/bar'
  get 'foo/baz'
  devise_for :users, :controllers => { :registrations => "my_registrations", omniauth_callbacks: "users/omniauth_callbacks"}
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
    # heroku 無效
  end 
  root "items#index"

  # get 'welcomes/about_me'
  # root "welcomes#about_me"

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
      get :confirm_email
    end
  end
  resources :followships, only: [:create, :destroy]

  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
    end
  end

end
