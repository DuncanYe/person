Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  get 'welcomes/about_me'
  root "welcomes#about_me"
end
