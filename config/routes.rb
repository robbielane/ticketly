Rails.application.routes.draw do
  root to: "home#index"
  resources :pursuits, only: [:index, :show]
  resources :cart_pursuits, only: [:new, :create]

  # resources :activity, only: [:show] do
  #   resources :pursuits, only: [:index]
  # end
  get "/cart", to: "cart_pursuits#show"
  put "/cart", to: "cart_pursuits#update"

  get "/:activity_name", to: "activity#show"
end
