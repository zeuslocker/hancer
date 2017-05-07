class CreateInputs < ActiveRecord::Migration[5.0]
  def change
    create_table :inputs, id: :uuid do |t|
      t.string :name, null: false
      t.uuid :client_id, index: true, foreign_key: true, index: false

      t.timestamps
    end
  end
end
