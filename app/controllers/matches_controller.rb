class MatchesController < ApplicationController
  def index
    @matches = Match.all
    @team = current_user.team
  end

  def new
    @match = Match.new
    @team = current_user.team
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
      redirect_to start_match_path(@match), notice: 'Partida criada com sucesso.'
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
  end

  def start_match
    @match = Match.find(params[:id])
  end

  def generate_result
    @match = Match.find(params[:id])

    home_top_players = @match.home_team.players.where(injury: false).order(level: :desc).limit(11)
    away_top_players = @match.away_team.players.where(injury: false).order(level: :desc).limit(11)

    case home_top_players.sum(:level)
    when 0..150
      @match.home_score = rand(0..1)
    when 151..250
      @match.home_score = rand(1..2)
    when 251..350
      @match.home_score = rand(2..3)
    else
      @match.home_score = rand(3..4)
    end

    case away_top_players.sum(:level)
    when 0..150
      @match.away_score = rand(0..1)
    when 151..250
      @match.away_score = rand(1..2)
    when 251..350
      @match.away_score = rand(2..3)
    else
      @match.away_score = rand(3..4)
    end

    if @match.save
      redirect_to match_path(@match), notice: 'Resultado gerado com sucesso.'
    else
      flash[:alert] = 'Erro ao salvar o resultado.'
      render :show, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_or_away_team, :opponent_team_id, :user_team_id)
  end
end
