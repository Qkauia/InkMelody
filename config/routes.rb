Rails.application.routes.draw do
  
  # get '/products', to: "products#index"
  # get "/products/new", to: "products#new", as: :new_product
  # get '/products/:id', to: "products#show", as: :product
  # get '/products/:id/edit', to: "products#edit", as: :edit_product
  # patch '/products/:id', to: "products#update"
  # delete '/products/:id', to: "products#destroy"
  # post "products", to: "products#create"
  resources :products do
    resources :comments, shallow: true ,only: [ :create , :destroy ]
  end


  resource :users, except: [ :destroy ] do
    collection do
      get :sign_in
    end
    # == get '/users/sign_in', to: 'users#sign_in'
  end
  resource :sessions, only: [ :create , :destroy ]

  root "products#index"
  get "privacy", to: "pages#privacy"
  get "about", to: "pages#about", as: :about
  
  
end
