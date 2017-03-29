class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks, id: :uuid do |t|
      t.string :number_plate

      t.timestamps
    end
  end
end
