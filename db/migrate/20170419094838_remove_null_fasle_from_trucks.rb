class RemoveNullFasleFromTrucks < ActiveRecord::Migration[5.0]
  def change
    change_column :trucks, :driver_id, :uuid, foreign_key: true, null: true
    remove_index :trucks, :driver_id
  end
end
