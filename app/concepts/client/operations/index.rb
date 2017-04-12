require_relative 'new'
class Client
  class Index < Trailblazer::Operation
    step Nested(::Client::New)
  end
end
