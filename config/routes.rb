Rails.application.routes.draw do
  root to: "home#index"
  resources :tickets, only: [:index, :show]
  resources :cart_tickets, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :events, only: [:index, :show]

  get "/admin/dashboard", to: "admin#dashboard"

  namespace :admin do
    resources :tickets
    resources :orders
  end

  get "/cart", to: "cart_tickets#show"
  put "/cart", to: "cart_tickets#update"
  delete "/cart", to: "cart_tickets#delete"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/dashboard", to: "users#dashboard"
  post "/checkout", to: "orders#create"

  get "/:activity_name", to: "activity#show" # keep at bottom of routes
end
