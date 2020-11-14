Rails.application.routes.draw do
  post "/auth", to: "user_token#create"
  namespace :v1 do
    resources :users
    resources :services
  end
end
