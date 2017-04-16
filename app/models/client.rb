class Client < ApplicationRecord
  has_many :inputs
  accepts_nested_attributes_for :inputs
end
