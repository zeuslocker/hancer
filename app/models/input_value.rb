class InputValue < ApplicationRecord
  belongs_to :input
  has_many :input_value_trucks
  has_many :trucks, through: :input_value_trucks
end
