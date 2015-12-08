Rails.application.routes.draw do
  root to: "home#index"
  resources :tickets, only: [:index, :show]
  resources :cart_tickets, only: [:new, :create]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :orders, only: [:index, :show]
  resources :events, only: [:index, :show] do
    get :autocomplete_event_name, :on => :collection
  end

  get "/platform-admin/dashboard", to: "platform_admin/admin#dashboard"
  get "/platform-admin/vendor/:id", to: "platform_admin/vendor#edit", as: :platform_admin_vendor
  patch "/platform-admin/vendor/:id", to: "platform_admin/vendor#update"

  get "/cart", to: "cart_tickets#show"
  put "/cart", to: "cart_tickets#update"
  delete "/cart", to: "cart_tickets#delete"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#delete"
  get "/dashboard", to: "users#dashboard"
  post "/checkout", to: "orders#create"

  scope ":vendor", module:"vendor_admin", as: :vendor  do
    resources :tickets
    resources :orders
    resources :events, only: [:new, :create]
    get "/dashboard", to: "vendor#dashboard"
    get "/", to: "vendor#show"
    get "/event/select", to: "vendor#select_event"
  end

  get "/:category_name", to: "category#show" # keep at bottom of routes
end
