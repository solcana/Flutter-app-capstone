Rails.application.routes.draw do
devise_for :users

resources :travel_logs
resources :users

  get "/logs", to: "logs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "logs#index"
end
