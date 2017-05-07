class AddIndexToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_index :drivers, :created_at
  end
end
