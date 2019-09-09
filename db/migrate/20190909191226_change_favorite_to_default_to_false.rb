class ChangeFavoriteToDefaultToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column(:follows, :favorite, :boolean, default: false)
  end
end
