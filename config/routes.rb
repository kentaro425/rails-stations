Rails.application.routes.draw do
  namespace :admin do
    get 'movies' => 'movies#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#index"
end
