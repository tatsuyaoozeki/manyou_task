Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tasks#index'
  resources :tasks
  resources :sessions, only: [:new, :create, :show]
  resources :users
end
