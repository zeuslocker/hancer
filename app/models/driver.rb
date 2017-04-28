class Driver < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :trucks
  
  after_destroy do |record|
    Truck.where(driver_id: record.id).destroy_all
  end
end
