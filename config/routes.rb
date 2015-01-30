Rails.application.routes.draw do

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  root 'topics#index'

  resources :users
  resources :topics do
    collection do
      get :random
    end

    member do
      post :star
      post :unstar
    end

    resources :examples
  end

  resources :comments

  namespace :admin do
    root 'base#index', as: ''
  end
end