require_relative 'new'

class Truck
  class Create < Trailblazer::Operation
    step Nested(::Truck::New)
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
