Rails.application.routes.draw do
  resources :categories
  devise_for :users
  root 'homepages#index'
  put '/article/:id/vote', to: 'articles#vote', as: 'vote'
  resources :articles
  resources :votes
end
