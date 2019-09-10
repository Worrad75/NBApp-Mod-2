class TeamsController < ApplicationController

    # before_action :authorize

    def index
        @teams = Team.all
    end

    def show
        @team = Team.find(params[:id])
    end
    
end