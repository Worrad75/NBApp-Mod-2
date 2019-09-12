class Forum < ApplicationRecord
    belongs_to :player

    belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

    #has_many :comments
    validates :title, length: { maximum: 75 }
    validates :title, presence: true


end
