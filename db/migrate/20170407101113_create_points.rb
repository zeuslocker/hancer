class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
