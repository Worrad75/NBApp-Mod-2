class AddSeasonStageAndArenaToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :season_stage, :integer
    add_column :games, :arena, :string
  end
end
