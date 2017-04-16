class CreateInputValues < ActiveRecord::Migration[5.0]
  def change
    create_table :input_values, id: :uuid do |t|
      t.uuid :truck_id
      t.uuid :input_id
      t.uuid :driver_id
      t.string :value

      t.timestamps
    end
  end
end
