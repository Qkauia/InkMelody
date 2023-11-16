Rails.application.routes.draw do
  
  # get "up" => "rails/health#show", as: :rails_health_check

  # get "about_us", to: "pages#about"
  get "about", to: "pages#about"
  get "privacy", to: "pages#privacy"
  root "welcome#index"

  
end
