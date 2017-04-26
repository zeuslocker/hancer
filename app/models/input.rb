class Input < ApplicationRecord
  belongs_to :client, optional: true
  has_many :input_values, dependent: :destroy
  scope :without_default, -> { where.not('name=? OR name=? OR name=?', 'points', 'fraktnr', 'kommentar') }
end
