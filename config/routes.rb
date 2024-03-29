Rails.application.routes.draw do
  
  resources :product_items
  resources :orders

  get 'cart', to: 'carts#show'
   
  resource :cart, only: [:destroy]

  resources :categories 
  resources :products do
      collection do
      post :index
    end
  end

  namespace :admin do
    resources :users
    resources :products
    resources :categories 
    resources :orders 
    get 'ordered_products', to: 'orders#list_of_ordered_products'
  end

  root 'mains#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
end
