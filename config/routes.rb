Rails.application.routes.draw do
  get "/auth/facebook/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get  "/dashboard", to: "dashboard#show"
  root "home#show"
  get  "/spots", to: "spots#index"
end
