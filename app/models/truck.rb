class Truck < ApplicationRecord
  belongs_to :driver
  has_many :input_value_trucks
  has_many :input_values, through: :input_value_trucks 
end
