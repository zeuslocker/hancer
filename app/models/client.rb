class Client < ApplicationRecord
  extend OrderAsSpecified

  has_many :inputs, dependent: :destroy
  accepts_nested_attributes_for :inputs
  default_scope { order(created_at: :desc) }
end
