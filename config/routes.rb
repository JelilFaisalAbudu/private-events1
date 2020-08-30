Rails.application.routes.draw do
  get 'events/new'
  get 'events/index'
  get 'events/show'
  resources :users
  resources :events
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 root 'events#index'
end
