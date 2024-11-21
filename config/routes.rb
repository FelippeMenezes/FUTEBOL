Rails.application.routes.draw do
  # Rotas para Teams
  get '/teams', to: 'teams#index', as: :teams
  get '/teams/new', to: 'teams#new', as: :new_team
  post '/teams', to: 'teams#create'
  get '/teams/:id', to: 'teams#show', as: :team
  get '/teams/:id/edit', to: 'teams#edit', as: :edit_team
  patch '/teams/:id', to: 'teams#update'
  put '/teams/:id', to: 'teams#update'
  delete '/teams/:id', to: 'teams#destroy'

  # Rotas para Players
  get '/teams/:team_id/players/new', to: 'players#new', as: :new_team_player
  post '/teams/:team_id/players', to: 'players#create'
  get '/players/:id/edit', to: 'players#edit', as: :edit_player
  patch '/players/:id', to: 'players#update'
  put '/players/:id', to: 'players#update'
  delete '/players/:id', to: 'players#destroy'

  # Rotas para Matches
  get '/matches', to: 'matches#index', as: :matches
  get '/matches/new', to: 'matches#new', as: :new_match
  post '/matches', to: 'matches#create'
  
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
