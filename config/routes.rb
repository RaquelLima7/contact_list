Rails.application.routes.draw do
  resources :contacts
  devise_for :users
  root to: "contacts#index"
end
