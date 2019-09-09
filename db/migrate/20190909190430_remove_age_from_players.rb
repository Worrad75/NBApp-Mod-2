class RemoveAgeFromPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :age
  end
end
