Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :users
  root to: 'homepages#index'
  resources :articles
  resources :votes, only: %i[create destroy]
end
