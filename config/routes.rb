Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: [:show, :update, :edit] do
    resources :lists
  end

  resources :lists do
    resources :tasks
  end
end
