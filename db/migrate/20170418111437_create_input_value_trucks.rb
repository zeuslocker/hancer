class CreateInputValueTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :input_value_trucks, id: :uuid do |t|
      t.uuid :input_value_id, foreign_key: true, index: false
      t.uuid :truck_id, foreign_key: true, index: false
      t.timestamps
    end
  end
end
