Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :jobs, only[:index, :new, :create]
  # Defines the root path route ("/")
  root "jobs#index"
end
