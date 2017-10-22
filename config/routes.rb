Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions

  post '/users/search', to: "users#search"
end
