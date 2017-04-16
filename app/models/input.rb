class Input < ApplicationRecord
  belongs_to :client, optional: true
  has_many :input_values
end
