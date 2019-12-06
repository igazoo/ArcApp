Rails.application.routes.draw do

  get 'events/new'
  get 'sessions/new'
  get 'homes/index'
  get 'homes/about'
  get 'events/index'
  root 'homes#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
