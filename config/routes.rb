Rails.application.routes.draw do
  resources :games, only: [:index, :show, :create]
  root to: "games#index"
end
