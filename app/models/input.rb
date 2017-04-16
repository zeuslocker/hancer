class Input < ApplicationRecord
  belongs_to :client, optional: true
  has_many :input_values
  scope :without_default, -> { where.not('name=? OR name=?', 'points', 'fraktnr') }
end
