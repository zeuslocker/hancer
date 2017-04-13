class Note < ApplicationRecord
  delegate :number_plate, :driver_id, to: :truck, prefix: true
  belongs_to :truck
  has_and_belongs_to_many :clients
end
