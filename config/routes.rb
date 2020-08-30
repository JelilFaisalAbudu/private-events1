Rails.application.routes.draw do
  resources :users
  resources :events
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
 root 'users#show'
end
