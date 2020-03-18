Rails.application.routes.draw do
  get 'users/new'
  root 'toppages#home'
  # get  '/help',    to: 'static_pages#help'
end
