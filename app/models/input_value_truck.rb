class InputValueTruck < ApplicationRecord
  belongs_to :truck
  belongs_to :input_value, dependent: :destroy
end
