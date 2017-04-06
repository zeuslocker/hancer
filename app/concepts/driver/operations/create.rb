require_relative 'new.rb'
class Driver
  class Create < Trailblazer::Operation
    step Nested(::Driver::New), name: 'model.new'
    step ::Trailblazer::Operation::Contract::Validate(), name: 'model.validate'
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
