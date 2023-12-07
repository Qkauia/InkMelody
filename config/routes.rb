Rails.application.routes.draw do
  

  resources :products do
    resources :comments, shallow: true ,only: [ :create , :destroy ]
  end

  namespace :api do
    namespace :v1 do
      resources :products, only: [] do
        member do
          patch :like
        end
      end
    end
  end

  resource :cart, only: [ :show , :create , :destroy ] do
    collection do
      get :checkout
    end
  end
  resources :cart_items, only: [ :destroy ]
  
  resource :users, except: [ :destroy ] do
    collection do
      get :sign_in
    end
  end
  resource :sessions, only: [ :create , :destroy ]

  root "products#index"
  get "privacy", to: "pages#privacy"
  get "about", to: "pages#about", as: :about
  
  
end
