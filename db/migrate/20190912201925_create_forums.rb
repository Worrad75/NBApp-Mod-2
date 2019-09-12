class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.string :title
      t.text :description
      t.integer :author_id
      t.integer :player_id
    end
  end
end
