Rails.application.routes.draw do
  namespace :admin do
    resources :movies
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index]
  resources :sheets, only: [:index]
end
