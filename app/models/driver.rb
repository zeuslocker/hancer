class Driver < ApplicationRecord
  has_one :truck

  after_destroy do |record|
    Truck.where(driver_id: record.id).destroy_all
  end
end
