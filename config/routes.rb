Rails.application.routes.draw do
devise_for :users

resources :travel_logs do
    resources :comments
  end
resources :users
resources :destinations


  get 'my_logs', to: 'travel_logs#my_logs'
  get '/destinations', to: 'destinations#index'
  get '/destinations/:id', to: 'destinations#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "travel_logs#index"
end
