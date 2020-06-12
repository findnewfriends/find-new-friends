Rails.application.routes.draw do
  default_url_options :host => "thp-find-new-friends.herokuapp.com"
  devise_for :users
  root :to => 'static_pages#home'
  resources :matches, only: [:show, :index]
  resources :users, only: [:index, :show]
end
