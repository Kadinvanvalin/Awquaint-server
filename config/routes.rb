Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions

  post '/users/search', to: "users#search"

  post '/invitations', to: "invitations#create"

  post '/invitations/check', to: "invitations#check"
end
