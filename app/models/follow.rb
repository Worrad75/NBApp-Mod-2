class Follow < ApplicationRecord
    belongs_to :player
    belongs_to :user
end