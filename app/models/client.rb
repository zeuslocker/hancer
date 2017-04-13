class Client < ApplicationRecord
  has_many :inputs
  has_and_belongs_to_many :notes
  accepts_nested_attributes_for :inputs
end
