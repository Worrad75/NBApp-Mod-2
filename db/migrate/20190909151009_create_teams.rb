class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :full_name
      t.string :city
      t.string :conference
      t.string :division
      t.string :abv
    end
  end
end
