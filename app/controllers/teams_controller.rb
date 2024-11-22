class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(team_params)
    @team.cash = 1000000
    if @team.save
      redirect_to @team, notice: 'Team created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to @team, notice: 'Team updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path, notice: 'Team deleted successfully.'
  end

  def buy_players
    @team = Team.find(params[:id])
    player_ids = params[:team] ? params[:team][:player_ids] : nil

    if player_ids.present?
      total_price = buy_update_team_players(player_ids)
      buy_update_team_cash(total_price)
      redirect_to players_path, notice: 'Jogadores atualizados com sucesso.'
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado.'
    end
  end

  def sell_players
    @team = Team.find(params[:id])
    player_ids = params[:team] ? params[:team][:player_ids] : nil

    if player_ids.present?
      total_price = sell_update_team_players(player_ids)
      sell_update_team_cash(total_price)
      redirect_to players_path, notice: 'Jogadores vendidos com sucesso.'
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado.'
    end
  end

  private

  def buy_update_team_players(player_ids)
    players = Player.find(player_ids)
    total_price = players.sum { |player| player.price }    
    if @team.cash >= total_price
      @team.player_ids = (@team.player_ids + player_ids).uniq
    else
      redirect_to players_path, alert: 'Dinheiro insuficiente.' and return
    end

    total_price
  end

  def buy_update_team_cash(total_price)
    @team.cash -= total_price
    @team.save
  end

  def sell_update_team_players(player_ids)
    total_price = 0
    player_ids.each do |player_id|
      player = Player.find(player_id)
      total_price += player.price
      random_team = Team.where.not(id: @team.id).sample
      player.update(team: random_team)
    end
    total_price
  end

  def sell_update_team_cash(total_price)
    @team.cash += total_price
    @team.save
  end

  def team_params
    params.require(:team).permit(:name, :cash)
  end
end
