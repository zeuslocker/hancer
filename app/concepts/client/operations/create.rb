require_relative 'new'
class Client
  class Create < Trailblazer::Operation
    step Nested(::Client::New)
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
