Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :users
  resources :shops
  
  resources :products, only: [:show, :index, :new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'products,to:products#index', as: :show_product
  #get 'products/: id, to:product#show',as: :products
  
end
