Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions

  get '/users/search', to: "users#search"
end
