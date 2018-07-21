Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  
  resources :trips, only: [:index]

  resources :stations, only: [:index]
  resources :conditions, only: [:index, :show]


  get '/:id', to: 'stations#show'
end
