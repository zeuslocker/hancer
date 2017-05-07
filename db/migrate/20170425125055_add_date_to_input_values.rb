class AddDateToInputValues < ActiveRecord::Migration[5.0]
  def change
    add_column :input_values, :date, :datetime
  end
end
