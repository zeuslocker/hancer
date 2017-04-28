class InputValue < ApplicationRecord
  belongs_to :input
  has_one :client, through: :input
  has_one :input_value_truck, dependent: :destroy
  has_one :truck, through: :input_value_truck
end
