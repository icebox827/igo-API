Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  namespace :api do
    namespace :v1, default: { format: :json } do
      resources :users, only: %i[index show create]
      resources :cars
      resources :booked_cars
      resources :sessions, only: %i[create destroy]
    end
  end

  get '*path', to: 'pages#index', via: :all

  scope :sessions do
    get 'sign_out' => 'sessions#destroy'
  end
end
