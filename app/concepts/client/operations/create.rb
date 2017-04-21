require_relative 'new'
class Client
  class Create < Trailblazer::Operation
    step Nested(::Client::New)
    success :form_prepopulate
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
    # step :create_base_inputs

    def form_prepopulate(options, **)
      options['contract.default'].prepopulate!(inputs: [{name: 'fraktnr'}, {name: 'points'}])
      true
    end

    def create_base_inputs(options, **)
      options['model'].inputs.create(name: 'fraktnr')
      options['model'].inputs.create(name: 'points')
    end
  end
end
