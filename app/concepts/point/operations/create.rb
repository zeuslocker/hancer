require_relative 'new.rb'

class Point
  class Create < Trailblazer::Operation
    step Nested(::Point::New), name: 'model.new'
    step ::Trailblazer::Operation::Contract::Validate(), name: 'model.validate'
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
