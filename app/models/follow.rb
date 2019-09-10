# == Schema Information
#
# Table name: follows
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  user_id    :integer
#  favorite   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Follow < ApplicationRecord
    belongs_to :player
    belongs_to :user
end
