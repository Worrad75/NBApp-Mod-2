class User < ApplicationRecord
    has_secure_password
    validates :password, length: { minimum: 6 }
    
    def follows
        Follow.all.select do |follow|
            follow.user_id == self.id
        end
    end

    def followed_players
        follows.map do |follow|
            Player.find(follow.player_id)
        end
    end
end