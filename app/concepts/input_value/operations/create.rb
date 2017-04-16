class InputValue
  class Create < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract InputValue::Contract::InputValueForm
    success :check
    step Model(::InputValue, :new)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    success :check
    step ::Trailblazer::Operation::Contract::Persist()

    def check(option, params:, **)
      binding.pry
    end
  end
end
