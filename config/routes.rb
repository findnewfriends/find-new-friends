Rails.application.routes.draw do
  # default_url_options :host => "thp-find-new-friends.herokuapp.com"
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root :to => 'static_pages#home'
  resources :matches, only: [:show, :index, :update]
  resources :users, only: [:index, :show]
end
