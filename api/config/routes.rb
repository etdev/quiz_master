Rails.application.routes.draw do
  namespace :v1 do
    resources :questions, only: [:index]
  end
end
