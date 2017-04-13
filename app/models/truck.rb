class Truck < ApplicationRecord
  belongs_to :driver
  has_many :notes
end
