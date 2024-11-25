class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    user_team = Team.find(params[:match][:user_team_id])
    opponent_team = Team.find(params[:match][:opponent_team_id])

    @match = Match.new
    if params[:match][:home_or_away_team] == 'home_team'
      @match.home_team = user_team
      @match.away_team = opponent_team
    else
      @match.home_team = opponent_team
      @match.away_team = user_team
    end

    if @match.save
      redirect_to match_path(@match), notice: 'Partida criada com sucesso.'
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def generate_result
    @match = Match.find(params[:id])
    # Lógica para gerar o resultado da partida
    @match.home_score = rand(0..5)
    @match.away_score = rand(0..5)
    if @match.save
      redirect_to match_path(@match), notice: 'Resultado gerado com sucesso.'
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_or_away_team, :opponent_team_id, :user_team_id)
  end
end
