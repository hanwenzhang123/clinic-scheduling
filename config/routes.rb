Rails.application.routes.draw do
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

  match '*path', to: 'errors#not_found', via: :all
end