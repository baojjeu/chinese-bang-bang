Rails.application.routes.draw do

  devise_for :users

  root 'topics#index'

  resources :topics do
    collection do
      get :random
    end

    resources :examples
  end

  namespace :admin do
    root 'base#index'
  end
end