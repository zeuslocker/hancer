class Truck < ApplicationRecord
  belongs_to :driver, dependent: :destroy
end
