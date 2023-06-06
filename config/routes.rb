Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs
  post '/search',  to: 'blogs#search'
  get  '/search',  to: 'blogs#search'
end
