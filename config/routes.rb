Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :movies, only: :index
  # Defines the root path route ("/")
  # root "articles#index"
end
