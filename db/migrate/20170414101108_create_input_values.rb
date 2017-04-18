class CreateInputValues < ActiveRecord::Migration[5.0]
  def change
    create_table :input_values, id: :uuid do |t|
      t.uuid :input_id, foreign_key: true, index: false
      t.string :value

      t.timestamps
    end
  end
end
