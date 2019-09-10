class PlayersController < ApplicationController

    # before_action :authorize

    def index
        @players = Player.all
    end

    def show
        @player = Player.find(params[:id])
        @team = Team.find(@player.team_id)
        @current_user = current_user
    end
    
end