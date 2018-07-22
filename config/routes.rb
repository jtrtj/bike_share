Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :trips, only: [:index]

  resources :stations, only: [:index, :show]
  resources :conditions, only: [:index, :show]

  get '/:id', to: 'stations#show'

end
