class DropThreads < ActiveRecord::Migration[5.2]
  def change
    drop_table :threads
  end
end
