class Player < ApplicationRecord
    belongs_to :team

    def full_name
        self.f_name + " " + self.l_name
    end
end