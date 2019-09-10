class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.datetime :date
      t.integer :home_id
      t.integer :home_score
      t.integer :away_id
      t.integer :away_score
      t.boolean :postseason
      t.integer :season_year
    end
  end
end
