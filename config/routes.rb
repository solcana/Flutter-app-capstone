Rails.application.routes.draw do
devise_for :users

resources :travel_logs
resources :users
resources :destinations

  get "/logs", to: "logs#index"
  get 'my_logs', to: 'logs#my_logs'
  get '/destinations', to: 'destinations#index'
  get '/destinations/:id', to: 'destinations#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "logs#index"
end
