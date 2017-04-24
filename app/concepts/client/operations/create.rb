require_relative 'new'
class Client
  class Create < Trailblazer::Operation
    step Nested(::Client::New)
    success :form_prepopulate
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()

    def form_prepopulate(options, **)
      options['contract.default'].prepopulate!(inputs: [{name: 'fraktnr'}, {name: 'points'}, {name: 'kommentar'}])
    end
  end
end
