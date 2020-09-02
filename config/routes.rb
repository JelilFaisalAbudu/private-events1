Rails.application.routes.draw do
  resources :events, only: [:new, :index, :show, :create, :attended_event, :unattend_event]
  resources :users
 
  get 'events/new'
  get 'events/show'
  post 'add_events_attending', to: 'events#attend_event'
  post 'rem_events_attending', to: 'events#unattend_event'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'events#index'
end
