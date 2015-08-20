Rails.application.routes.draw do

  root 'welcome#index'

  get 'signup' , to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'ranking_have' => 'ranking#have'
  get 'ranking_want' => 'ranking#want'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :ownerships, only: [:create, :destroy]
  resources :items , only: [:new , :show]

end
