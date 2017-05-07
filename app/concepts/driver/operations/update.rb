class Driver
  class Update < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract Driver::Contract::DriverForm

    step Model(::Driver, :find_by)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
