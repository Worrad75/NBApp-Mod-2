Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index, :new, :create]
  get "/signup" => "users#new", as: "new_user"
  post "/users" => "users#create"

  resources :players, :teams, only: [:index, :show]

  resources :sessions, only: [:create, :destroy]
  get "/login", to: "sessions#new", as: "new_session"
  
  resources :games, only: [:index, :show]

  # UNDER CONSTRUCTION
  post "/follow_player/:player_id", to: "users#follow_player"
  delete "/unfollow_player/:player_id", to: "users#unfollow_player"
end
