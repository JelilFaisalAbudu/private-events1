Rails.application.routes.draw do
  get 'events/new'
  get 'events/index'
  get 'events/show'
  resources :users
  resources :events
  
  post 'add_events_attending', to: 'events#attended_event'
  post 'rem_events_attending', to: 'events#unattend_event'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'events#index'
end
