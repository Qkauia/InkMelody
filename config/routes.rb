Rails.application.routes.draw do
  
  # get "up" => "rails/health#show", as: :rails_health_check

  # get "about_us", to: "pages#about"
  get "about", to: "pages#about", as: :about
  get "privacy", to: "pages#privacy"
  get "/products/new", to: "products#new", as: :new_product
  post "products", to: "products#create"

  root "welcome#index"

  
end
