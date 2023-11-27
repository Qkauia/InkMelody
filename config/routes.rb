Rails.application.routes.draw do
  
  # get '/products', to: "products#index"
  # get "/products/new", to: "products#new", as: :new_product
  # get '/products/:id', to: "products#show", as: :product
  # get '/products/:id/edit', to: "products#edit", as: :edit_product
  # patch '/products/:id', to: "products#update"
  # delete '/products/:id', to: "products#destroy"
  # post "products", to: "products#create"
  
  
  resources :products
  resource :users, except: [ :destroy ]

  root "products#index"
  get "privacy", to: "pages#privacy"
  get "about", to: "pages#about", as: :about
  
  
end
