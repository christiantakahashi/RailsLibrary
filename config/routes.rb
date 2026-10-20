Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"
  get "about", to: "pages#about"
  resources :books
  resources :authors, only: [ :index, :show, :new, :create ]
end
