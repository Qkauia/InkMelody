Rails.application.routes.draw do
  
  # get "up" => "rails/health#show", as: :rails_health_check

  # get "about_us", to: "pages#about"
  get "about", to: "pages#about", as: :about
  get "privacy", to: "pages#privacy"
  get '/products', to: "products#index"
  get "/products/new", to: "products#new", as: :new_product
  get '/products/:id', to: "products#show", as: :product
  get '/products/:id/edit', to: "products#edit", as: :edit_product
  patch '/products/:id', to: "products#update"
  delete '/products/:id', to: "products#destroy"

  post "products", to: "products#create"

  root "products#index"

  
end
