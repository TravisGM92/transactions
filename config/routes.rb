# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#main'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'
  
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
end
