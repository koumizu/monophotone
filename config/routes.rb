Rails.application.routes.draw do
  root 'toppages#home'
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
