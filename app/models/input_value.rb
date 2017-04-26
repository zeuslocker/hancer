class InputValue < ApplicationRecord
  belongs_to :input
  has_many :input_value_trucks, dependent: :destroy
  has_many :trucks, through: :input_value_trucks
end
