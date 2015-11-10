Rails.application.routes.draw do
  resources :pursuits, only: [:index]
end
