Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/dashboard', to: 'dashboard#show'
  get '/trips-dashboard', to: 'trips#dashboard'

  resources :users, only: [:new, :create, :edit, :update] do
    resources :orders, only: [:create]
  end

  resources :orders, only: [:show, :update]

  resources :trips, only: [:index, :show]

  resources :stations, only: [:index]

  get '/stations-dashboard', to: 'stations#dashboard'
  resources :carts, only: [:create]

  namespace :admin do
    resources :stations, only: [:new, :create, :edit, :update, :destroy]
    resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    resources :trips, only: [:new, :create, :edit, :update, :destroy]
    resources :dashboard, only: [:index]
    resources :items, only: [:create]

    get '/bike-shop', to: 'items#index'
    get '/bike-shop/new', to: 'items#new'
    get '/bike-shop/:id', to: 'items#edit', as: 'item'
    patch '/bike-shop/:id', to: 'items#update'
  end

  get '/conditions-dashboard', to: 'conditions#dashboard'
  resources :conditions, only: [:index, :show]

  resources :items, only: [:index, :show]

  get '/bike-shop', to: 'items#index'
  get '/cart', to: 'carts#show'
  post'/cart', to: 'carts#update'
  get '/:id', to: 'stations#show', as: 'station'
  get '/:id', to: 'trips#show'
end
