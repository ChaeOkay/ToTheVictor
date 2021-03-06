class PlayersController < ApplicationController
	def index
    @players = Player.all
	end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:notice] = "Player Updated"
      redirect_to players_path
    else
      flash[:alert] = "There was a problem!"
    end
  end

  def destroy
    @player = Player.find(params[:id])
    if @player.destroy
      flash[:notice] = "Player deleted"
      redirect_to players_path
    else
      flash[:alert] = "There was a problem!"
    end
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
