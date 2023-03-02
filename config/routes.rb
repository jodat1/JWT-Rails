Rails.application.routes.draw do
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  resources :pigs, only: [:index, :create]
  post "pig", to: "pigs#create"
end
