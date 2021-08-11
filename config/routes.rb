Rails.application.routes.draw do
  devise_for :users
<<<<<<< HEAD
  root to: 'pages#home'
  resources :users
  resources :shops #, only: [ :new, :create, :show ]
  
=======
  root to: 'products#index'
    resources :users
>>>>>>> 05a373ab08c0b0c8863ad7db89e8bd6aa2afd0fe
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'products,to:products#index', as: :show_product
  #get 'products/: id, to:product#show',as: :products
  resources :products, only: [:show,:index]
end
