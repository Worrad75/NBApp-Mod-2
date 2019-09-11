class CreateStatline < ActiveRecord::Migration[5.2]
  def change
    create_table :statlines do |t|
      t.integer :player_id
      t.integer :game_id
      t.integer :pts
      t.integer :ast
      t.integer :reb
      t.integer :stl
      t.integer :blk
      t.integer :turnover
      t.integer :pf
      t.string :min
      t.integer :dreb
      t.integer :oreb
      t.float :fg_pct
      t.integer :fga
      t.integer :fgm
      t.float :fg3_pct
      t.integer :fg3a
      t.integer :fg3m
      t.float :ft_pct
      t.integer :fta
      t.integer :ftm
    end
  end
end
