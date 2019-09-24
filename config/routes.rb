Rails.application.routes.draw do
  root to: 'tasks#index'
  get 'sessions/new'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
  namespace :admin do
    resources :users
  end
  resources :users

  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
