Rails.application.routes.draw do

  resources :categories
  # resources :products

  resources :products do
    collection do
      get :search
    end
  end

  # get 'search', to: 'products#search'

  root 'mains#index'

  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
end
