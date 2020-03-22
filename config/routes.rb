Rails.application.routes.draw do
  root 'toppages#home'
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/toppages/guest_sign_in', to: 'toppages#new_guest'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts , only: [:new, :show, :create , :destroy ] do
    resources :comments
    member do
      get :likes
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :favorites,           only: [:create, :destroy]
end
