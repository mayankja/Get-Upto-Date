Rails.application.routes.draw do
  root 'home#index'

  resources :news, only: [:create, :index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
