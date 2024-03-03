Rails.application.routes.draw do
  get 'shopping_cart/add_to_cart'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root 'root#index'
  get 'errors/not_found'

  resources :messages

  namespace :api do
    namespace :v1 do
      resources :providers, only: [:index, :show]
      resources :members, only: [:index, :show]
      resources :consultations do
        member do
          post 'consultation_cancelled'
          post 'consultation_completed'
        end
      end
    end
  end

  namespace :api do
    namespace :v2 do
      resources :products
      resources :bundles
      resources :cart_items
      resources :checkouts

      post '/shopping_cart/add_product_to_cart/:product_id', to: 'shopping_cart#add_to_cart'
      post '/shopping_cart/add_bundle_to_cart/:bundle_id', to: 'shopping_cart#add_to_cart'
      post '/shopping_cart/checkout', to: 'shopping_cart#checkout'
    end
  end

  match '*path', to: 'errors#not_found', via: :all
end