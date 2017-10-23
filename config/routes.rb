Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :sessions

  post '/users/search', to: "users#search"

  post '/invitations', to: "invitations#create"

  post '/invitations/check', to: "invitations#check"

  post '/invitations/response', to: "invitations#invitation_response"

  post '/users/profile', to: "users#add_image"
end
