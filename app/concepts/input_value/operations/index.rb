class InputValue
  class Index < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Admin::Contract::AdminForm

    step :setup_model
    step ::Trailblazer::Operation::Contract::Build()
    step :prepopulate_form

    def prepopulate_form(options, **)
      options['contract.default'].prepopulate!
    end

    def setup_model(options, **)
      options['model'] = ::Admin.take
    end
  end
end
