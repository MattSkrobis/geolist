Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :lists, only: [:index, :show] do
    resources :tasks, only: [:update]
  end

  namespace :user do
    resource :profile, only: [:show, :update, :edit], controller: 'profile'
    resources :lists do
      resources :tasks, except: [:index]
    end
  end
end
