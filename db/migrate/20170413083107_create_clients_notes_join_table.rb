class CreateClientsNotesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :clients_notes, id: false do |t|
      t.uuid :client_id
      t.uuid :note_id
    end
  end
end
