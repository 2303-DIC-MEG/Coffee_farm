Rails.application.routes.draw do
  resources :profiles
  resources :blogs
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'blogs#index'
  post '/search',  to: 'blogs#search'
  get  '/search',  to: 'blogs#search'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
