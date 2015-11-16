Rails.application.routes.draw do
  root to: "home#index"
  resources :pursuits, only: [:index, :show, :new, :create, :edit]
  resources :cart_pursuits, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:index, :show]

  get "/admin/dashboard", to: "admin#dashboard"
  # get "/admin/pursuits", to: "pursuits#index"
  # put "/admin/pursuits/:id/edit", to: "pursuits#edit"

  namespace :admin do
    resources :pursuits
    resources :orders
  end

  get "/cart", to: "cart_pursuits#show"
  put "/cart", to: "cart_pursuits#update"
  delete "/cart", to: "cart_pursuits#delete"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/dashboard", to: "users#dashboard"
  post "/checkout", to: "orders#create"

  get "/:activity_name", to: "activity#show" # keep at bottom of routes
end
