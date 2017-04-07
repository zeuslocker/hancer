class Driver < ApplicationRecord
  has_one :truck, dependent: :destroy
end
