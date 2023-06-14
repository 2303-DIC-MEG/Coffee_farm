Rails.application.routes.draw do
  root 'blogs#index'
  resources :profiles
  resources :blogs
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  
  post '/search',  to: 'blogs#search'
  get  '/search',  to: 'blogs#search'

  resources :favorites, only: [:index, :create, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
