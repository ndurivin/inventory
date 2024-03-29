Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :assets, only: [:index, :show, :create, :update, :destroy]
      resources :departments, only: [:index, :show, :create, :update, :destroy]
      resources :categories, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
