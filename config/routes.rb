Rails.application.routes.draw do
  root to: "home#index"
  resources :pursuits, only: [:index, :show]
  resources :cart_pursuits, only: [:new, :create]
  resources :users, only: [:new, :create, :show]

  # resources :activity, only: [:show] do
  #   resources :pursuits, only: [:index]
  # end

  get "/admin/dashboard", to: "admin#dashboard"

  get "/cart", to: "cart_pursuits#show"
  put "/cart", to: "cart_pursuits#update"
  delete "/cart", to: "cart_pursuits#delete"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/dashboard", to: "users#dashboard"
  get "/orders", to: "orders#index"

  post "/checkout", to: "orders#create"

  get "/:activity_name", to: "activity#show" # keep at bottom of routes
end
