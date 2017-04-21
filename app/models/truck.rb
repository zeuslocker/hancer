class Truck < ApplicationRecord
  belongs_to :driver
  has_many :input_value_trucks
  has_many :input_values, through: :input_value_trucks
  belongs_to :admin, optional: true
  accepts_nested_attributes_for :input_values, allow_destroy: true, reject_if: proc {|arrtibures| attributes[:value].blank? }
  before_save do
    self.admin_id = '3e90dd4d-3e2f-4cc3-ac4b-96ce56ad3763'
  end
end
