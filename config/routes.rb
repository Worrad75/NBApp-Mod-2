Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index]

  resources :players, :teams, only: [:index, :show]

  resources :sessions, only: [:new, :create, :destroy]

  # UNDER CONSTRUCTION
  post "/users/:id/follow_player", to: "users#follow_player()"
end
