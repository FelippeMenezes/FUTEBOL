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
    @team = Team.new(team_params)
    @team.user = current_user
    @team.cash = 1000000
    if @team.name.empty?
      error_messages = [
        'Ah... Você sabe que todo time precisa de um nome. Seja criativo!
        Seus torcedores vão adorar.',
        'Quer criar um time sem nome?
        Digite qualquer coisa, você poderá trocar o nome sempre que quiser.'
      ]
      redirect_to new_team_path, alert: error_messages.sample and return
    end
    if @team.name == "Honolulu Canoa Clube"
      @team.cash = 1000000000
    end
    if @team.save
      redirect_to @team, notice: 'Time criado.'
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
      redirect_to @team, notice: 'Nome do time atualizado.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team = Team.find(params[:id])
    Rails.logger.info "Excluindo time: #{@team.id}"
    @team.destroy
    redirect_to new_team_path, notice: 'Time excluído.'
  end

  def buy_players
    @team = Team.find(params[:id])
    if params[:team] && params[:team][:player_ids]
      player_ids = params[:team][:player_ids]
      players = Player.find(player_ids)
      total_price = players.sum(&:price)

      if @team.cash >= total_price
        @team.player_ids = (@team.player_ids + player_ids).uniq
        subtract_cash_from_team(total_price)
      else
        redirect_to players_path, alert: 'Dinheiro insuficiente.' and return
      end
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado.' and return
    end

    if @team.save
      buy_update_player_prices(players)
      redirect_to players_path, notice: 'Jogadores atualizados com sucesso.'
    else
      redirect_to players_path, alert: 'Erro ao salvar o time.'
    end
  end

  def sell_players
    @team = Team.find(params[:id])
    if params[:team] && params[:team][:player_ids]
      player_ids = params[:team][:player_ids]
      players = Player.find(player_ids)
      total_price = players.sum(&:price)

      players.each do |player|
        random_team = Team.where.not(id: @team.id).sample
        player.update(team: random_team)
      end

      add_cash_to_team(total_price)
      
      if @team.save
        sell_update_player_prices(players)
        redirect_to players_path, notice: 'Jogadores vendidos com sucesso.'
      else
        redirect_to players_path, alert: 'Erro ao salvar o time.'
      end
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado.'
    end
  end

  private

  def subtract_cash_from_team(total_price)
    @team.cash -= total_price
  end

  def buy_update_player_prices(players)
    players.each do |player|
      player.update(price: (player.price * 0.9).to_i)
    end
  end

  def add_cash_to_team(total_price)
    @team.cash += total_price
  end

  def sell_update_player_prices(players)
    players.each do |player|
      player.update(price: (player.price * 1.1).to_i)
    end
  end

  def team_params
    params.require(:team).permit(:name, :cash)
  end
end

