Rails.application.routes.draw do
  get 'user/index'
  devise_for :users
  root :to => 'static_pages#home'
  resources :matches, only: [:show, :index]
end
