Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs
  post '/search',  to: 'blogs#search'
  get  '/search',  to: 'blogs#search'
end
