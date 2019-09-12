# == Schema Information
#
# Table name: players
#
#  id       :integer          not null, primary key
#  f_name   :string
#  l_name   :string
#  position :string
#  weight   :integer
#  team_id  :integer
#

class Player < ApplicationRecord

    belongs_to :team #,
    # class: :Team,
    # foreign_key: :team_id
    # primary_key: :id

    # has_many :statlines
    has_many :follows
    has_many :users, through: :follows
    has_many :forums

    def full_name
        self.f_name + " " + self.l_name
    end

    def games
        self.team.games
    end

end
