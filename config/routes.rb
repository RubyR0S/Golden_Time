Rails.application.routes.draw do
  resources :orders
  resources :order_items
  get 'cart', to: 'cart#show'

  get 'final_order', to: 'order_items#create_final_order'

  resources :categories 
  resources :products do
      collection do
      post :index
    end
  end
  
  root 'mains#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
end
