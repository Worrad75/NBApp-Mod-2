class AddColumnsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :height, :float
    add_column :players, :collegeName, :string
    add_column :players, :country, :string

    remove_column :players, :position

    change_column :players, :weight, :float
  end
end
