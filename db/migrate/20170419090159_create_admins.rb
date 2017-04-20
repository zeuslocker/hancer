class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins, id: :uuid do |t|

      t.timestamps
    end
  end
end
