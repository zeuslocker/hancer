class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :full_name, null: false
      t.boolean :fraktnr, default: false
      t.boolean :points, default: false

      t.timestamps
    end
  end
end
