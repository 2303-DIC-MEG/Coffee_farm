Rails.application.routes.draw do
  root 'top#index'

  resources :profiles
  resources :blogs

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/sessions/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in', as: 'guest_admin_sign_in'
    post 'users/sessions/guest_coffee_farm_sign_in', to: 'users/sessions#guest_coffee_farm_sign_in', as: 'guest_coffee_farm_sign_in'
  end

  post '/search',  to: 'blogs#search'
  get  '/search',  to: 'blogs#search'
  get 'profile', to: 'profiles#show'

  resources :favorites, only: [:index, :create, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

