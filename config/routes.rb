Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks
  get 'tasks/search', 'tasks#search'
end
