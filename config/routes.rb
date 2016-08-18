Rails.application.routes.draw do
  resources :games, only: [:index, :show, :create] do
    resources :guesses, only: [:create]
  end
  root to: "games#index"
end
