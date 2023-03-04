Rails.application.routes.draw do
  get "/travel_logs", to: "travel_logs#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "travel_logs#index"
end
