class AddApiiDtoGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :api_id, :integer
  end
end
