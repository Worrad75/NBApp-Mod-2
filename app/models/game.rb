# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  date        :datetime
#  home_id     :integer
#  home_score  :integer
#  away_id     :integer
#  away_score  :integer
#  postseason  :boolean
#  season_year :integer
#

class Game < ApplicationRecord
    belongs_to :home_team,
    foreign_key: :home_id,
    class_name: :Team
    
    belongs_to :away_team,
    foreign_key: :away_id,
    class_name: :Team

    has_many :players, through: :teams

    def home
        Team.find(home_id)
    end

    def away
        Team.find(away_id)
    end

    def teams
        [home, away]
    end

    def players
        players = []
        teams.each do |team|
            team.players.each { |player| players << player }
        end
        players
    end

    def winner
        if self.home_score > self.away_score
            [home, home_score]
        else
            [away, away_score]
        end
    end
end
