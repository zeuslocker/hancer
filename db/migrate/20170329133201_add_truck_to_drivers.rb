class AddTruckToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :driver_id, :uuid, foreign_key: true, null: false
    add_index :trucks, :driver_id
  end
end
