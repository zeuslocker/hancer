require_relative 'new'
class Client
  class Create < Trailblazer::Operation
    step Nested(::Client::New)
  #  step :prepare_inputs
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()

    def prepare_inputs(options, params:, **)
      params[:inputs] = params[:inputs][0].map{|k, v| v.merge(id: k)}
    end
  end
end
