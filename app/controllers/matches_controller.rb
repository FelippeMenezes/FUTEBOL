class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    if params[:team_id].present?
      @team = Team.find(params[:team_id])
    else
      @team = nil
    end
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to match_path(@match), notice: 'Match scheduled successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:home_team_id, :away_team_id, :home_score, :away_score)
  end
end
