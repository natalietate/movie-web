Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index'
  resources :users
  resources :movies
  resources :groups, only: [:new, :create, :show]
  resources :group_watchlists, only: [:create, :destroy]
  
end
