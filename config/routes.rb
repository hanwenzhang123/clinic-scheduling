Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'root#index'
  get 'errors/not_found'

  resources :messages

  namespace :api do
    namespace :v1 do
      resources :providers, only: [:index, :show]
      resources :members, only: [:index, :show]
      resources :consultations, only: [:index, :show]
    end
  end

  match '*path', to: 'errors#not_found', via: :all
end