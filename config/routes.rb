Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :jobs, only: [:index, :new, :create, :edit, :update, :destroy]

  get '/jobs/rejected_jobs', to: 'jobs#rejected_jobs', as: 'rejected_jobs'

  # Defines the root path route ("/")
  root "jobs#index"
end
