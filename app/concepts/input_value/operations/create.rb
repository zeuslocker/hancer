class InputValue
  class Create < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract InputValue::Contract::InputValueForm

    step Model(::InputValue, :new)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
