Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resource :profile, only: [:show ,:update, :edit], controller: 'profile'
  resources :lists, only: [:index, :show]
  # do
  #   # resources :tasks, only: [:update]
  # end

  resources :my_lists do
    resources :tasks, except: [:index, :show]
  end
end
