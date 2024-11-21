class PlayersController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @player = @team.players.build
  end

  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.build(player_params)
    if @player.save
      redirect_to @team, notice: 'Player added successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to @player.team, notice: 'Player updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to @player.team, notice: 'Player removed successfully.'
  end

  private

  def player_params
    params.require(:player).permit(:name, :goalkeep, :strength, :speed, :balance, :agility, :price, :position)
  end
end

