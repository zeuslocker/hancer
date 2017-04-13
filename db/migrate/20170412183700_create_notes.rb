class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes, id: :uuid do |t|
      t.uuid :truck_id, index: true, foreign_key: true
      t.timestamps
    end
  end
end
