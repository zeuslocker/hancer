class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers, id: :uuid do |t|
      t.string :full_name

      t.timestamps
    end
  end
end
