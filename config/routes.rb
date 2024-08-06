Rails.application.routes.draw do
  devise_for :organizations
  resources :organization_profiles, only: %i[ edit update show ]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # Pages Routes
  get "home", to: "pages#home"
  get "about_us", to: "pages#about"
  get "contact", to: "pages#contact"
  get 'pricing', to: "pages#pricing"

  root "pages#about"
end
