Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :pull_requests, only: :index
  resources :comments, only: :index
end
