Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "/signup", to: "users#new"
      get "/login", to: "sessions#new"
      post "/sessions", to: "sessions#create"
      get '/forecast', to: 'weather#index'
      get '/salaries', to: 'cities#show'
      post '/road_trips', to: 'road_trip#create'
    end
  end
end
