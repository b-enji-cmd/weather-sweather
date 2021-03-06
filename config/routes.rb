Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post "/users", to: "users#create"
      post "/sessions", to: "sessions#create"
      get '/forecast', to: 'weather#index'
      get '/backgrounds', to: 'image#show'
      post '/road_trip', to: 'road_trip#create'
    end
  end
end
