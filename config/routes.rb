Rails.application.routes.draw do
  

  resources :products do
    resources :comments, shallow: true ,only: [ :create , :destroy ]
    member do
      patch :like
    end
  end


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
