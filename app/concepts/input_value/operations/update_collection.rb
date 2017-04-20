class InputValue
  class UpdateCollection < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract Admin::Contract::AdminForm

    step :setup_model
    step ::Trailblazer::Operation::Contract::Build()
    step :validate_collection
    step ::Trailblazer::Operation::Contract::Persist()

    def validate_collection(options, params:, **)
      options['contract.default'].validate(params[:reform])
    end

    def setup_model(options, **)
      options['model'] = ::Admin.take
    end
  end
end
