class Driver < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :trucks, dependent: :destroy
end
