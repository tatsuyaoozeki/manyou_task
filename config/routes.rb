Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  get 'sessions/new'
  root to: 'tasks#index'
  resources :tasks
  resources :sessions, only: [:new, :create, :destroy]
end
