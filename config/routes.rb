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
  patch '/teams/:id/sell_players', to: 'teams#sell_players', as: :sell_players_team
  patch '/teams/:id/buy_players', to: 'teams#buy_players', as: :buy_players_team

  # Rotas para Players
  get '/players', to: 'players#index', as: :players
  get '/teams/:team_id/players', to: 'players#index', as: :team_players
  get '/teams/:team_id/players/new', to: 'players#new', as: :new_team_player
  post '/teams/:team_id/players', to: 'players#create'
  get '/players/:id/edit', to: 'players#edit', as: :edit_player
  patch '/players/:id', to: 'players#update'
  put '/players/:id', to: 'players#update'
  delete '/players/:id', to: 'players#destroy'

  # Rotas para Matches
  get 'matches', to: 'matches#index', as: 'matches_index'
  get 'matches/new', to: 'matches#new', as: 'new_match'
  post 'matches', to: 'matches#create', as: 'matches'
  get 'matches/:id', to: 'matches#show', as: 'match'
  post 'matches/:id/generate_result', to: 'matches#generate_result', as: 'generate_result_match'

  devise_for :users

  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
