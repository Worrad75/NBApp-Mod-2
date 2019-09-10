# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  full_name  :string
#  city       :string
#  conference :string
#  division   :string
#  abv        :string
#

class Team < ApplicationRecord
    has_many :players

    has_many :games

    has_many :users, through: :players

    def games
        Game.all.select do |game|
            game.home_id == self.id || game.away_id == self.id
        end
    end

end
