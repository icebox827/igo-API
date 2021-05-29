Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, default: { format: :json } do
      resources :users, only: [:index, :show, :create]
      resources :cars
      resources :booked_cars
      resources :sessions, only: [:create, :destroy]
    end
  end

  delete 'api/v1/sessions/:id', to: 'api/v1/sessions#destroy'
end
