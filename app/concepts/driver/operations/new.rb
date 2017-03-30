class Driver
  class New < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL
    contract Driver::Contract::DriverForm
    step Model(::Driver, :new)
    step ::Trailblazer::Operation::Contract::Build()
  end
end
