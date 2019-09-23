Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  resources :users

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
