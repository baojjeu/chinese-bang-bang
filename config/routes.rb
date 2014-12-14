Rails.application.routes.draw do
  root 'pages#home'
  resources :topics do
    resources :examples
  end
end