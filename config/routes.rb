Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'categories/index'
      get 'categories/show'
      get 'categories/create'
      get 'categories/update'
      get 'categories/destroy'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
