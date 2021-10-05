Rails.application.routes.draw do
  devise_for :users
  root 'homepages#index'
  put '/article/:id/vote', to: 'articles#vote', as: 'vote'
  resources :articles
  resources :votes
  resources :users
  resources :categories
end
