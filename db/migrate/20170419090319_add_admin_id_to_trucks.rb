class AddAdminIdToTrucks < ActiveRecord::Migration[5.0]
  def change
    add_column :trucks, :admin_id, :uuid
  end
end
