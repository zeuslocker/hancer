class Truck < ApplicationRecord
  belongs_to :driver
  has_many :input_value_trucks, dependent: :destroy
  has_many :input_values, through: :input_value_trucks
  belongs_to :admin, optional: true
  accepts_nested_attributes_for :input_values, allow_destroy: true, reject_if: proc { |attributes| attributes[:value].blank? }
  default_scope { order(created_at: :desc) }
  before_save do
    self.admin_id = Admin.take.id
  end
end
