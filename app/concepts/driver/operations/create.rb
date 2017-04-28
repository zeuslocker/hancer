require_relative 'new.rb'
class Driver
  class Create < Trailblazer::Operation
    step Nested(::Driver::New)
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
