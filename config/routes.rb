Rails.application.routes.draw do
  namespace :admin do
    resources :movies do
      resources :schedules, only: [:new]
    end
    resources :schedules
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show]
  resources :sheets, only: [:index]
end
