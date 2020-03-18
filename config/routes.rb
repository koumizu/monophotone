Rails.application.routes.draw do
  root 'toppages#home'
  get '/signup',   to: 'users#new'
  # get  '/help',    to: 'static_pages#help'
end
