Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  delete "signout" => "sessions#destroy", as: "signout"
  resources :pull_requests, only: :index
  resources :comments, only: :index
  resources :repositories, only: :index
  resources :github_users, only: :index
end
