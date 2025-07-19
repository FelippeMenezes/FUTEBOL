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

    # Linha alterada para usar params[:buy] e ser mais segura
    player_ids_to_buy = params.dig(:buy, :player_ids) || []

    if player_ids_to_buy.any?
      players = Player.find(player_ids_to_buy)
      total_price = players.sum(&:price)

      if @team.cash >= total_price
        @team.players << players # Forma mais idiomática de adicionar jogadores
        subtract_cash_from_team(total_price)

        if @team.save
          buy_update_player_prices(players)
          redirect_to @team, notice: 'Jogadores comprados com sucesso.'
        else
          redirect_to players_path, alert: 'Erro ao salvar o time.'
        end
      else
        redirect_to players_path, alert: 'Dinheiro insuficiente para a compra.'
      end
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado para compra.'
    end
  end

  def sell_players
    @team = Team.find(params[:id])

    # Linha alterada para usar params[:sell] e ser mais segura
    player_ids_to_sell = params.dig(:sell, :player_ids) || []

    if player_ids_to_sell.any?
      players = Player.find(player_ids_to_sell)
      total_price = players.sum(&:price)

      # Verifica se os jogadores a serem vendidos realmente pertencem ao time
      if (player_ids_to_sell.map(&:to_i) - @team.player_ids).empty?
        @team.player_ids -= player_ids_to_sell.map(&:to_i) # Remove os jogadores do time
        add_cash_to_team(total_price)

        if @team.save
          sell_update_player_prices(players)
          redirect_to @team, notice: 'Jogadores vendidos com sucesso.'
        else
          redirect_to players_path, alert: 'Erro ao salvar o time.'
        end
      else
        redirect_to players_path, alert: 'Tentativa de vender jogadores que não pertencem ao seu time.'
      end
    else
      redirect_to players_path, alert: 'Nenhum jogador selecionado para venda.'
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
