class Admin < ApplicationRecord
  has_many :trucks
  accepts_nested_attributes_for :trucks, allow_destroy: true
end
