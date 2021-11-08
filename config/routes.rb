Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :users
  root 'homepages#index'
  resources :articles
  resources :votes, only: %i[create destroy]
end
