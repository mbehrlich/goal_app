Rails.application.routes.draw do

  resources :users, only: [:new, :show, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :goals
  resources :comments, only: [:create, :destroy]

end
