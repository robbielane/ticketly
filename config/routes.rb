Rails.application.routes.draw do
  resources :pursuits, only: [:index]

  # resources :activity, only: [:show] do
  #   resources :pursuits, only: [:index]
  # end
  get "/:activity_name", to: "activity#show"
end
