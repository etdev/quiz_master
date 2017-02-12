Rails.application.routes.draw do
  namespace :v1 do
    resources :questions, only: [:index, :show, :create, :update, :destroy]
    resources :guess_checks, only: [:show]
    resources :categories, only: [:index]
  end
end
