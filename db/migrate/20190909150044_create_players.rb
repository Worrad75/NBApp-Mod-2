class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :f_name
      t.string :l_name
      t.string :position
      t.integer :weight
      t.integer :age
      t.integer :team_id
    end
  end
end
