Rails.application.routes.draw do

  devise_for :users

  root 'topics#index'

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

  namespace :admin do
    root 'base#index', as: ''
  end
end