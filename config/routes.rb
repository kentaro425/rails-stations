Rails.application.routes.draw do
  namespace :admin do
    resources :movies do
      resources :schedules, only: [:new]
    end
    resources :schedules
    resources :reservations
    get 'get_schedules' => 'reservations#get_schedules'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show] do
    get 'reservation' => 'movies#reservation'
    resources :schedules, only: [:show] do
      resources :reservations, only: [:new]
    end
  end
  resources :sheets, only: [:index]
  resources :reservations, except: [:index, :new]
end
