Rails.application.routes.draw do
  resources :final_orders, only: [:new, :create]
  resources :order_items
  get 'cart', to: 'cart#show'

  resources :categories 
  resources :products do
      collection do
      post :index
    end
  end

  namespace :admin do
    resources :users
  end
  
  root 'mains#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
end
