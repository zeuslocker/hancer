class Truck
  class Update < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract Truck::Contract::TruckForm

    step Model(::Truck, :find_by)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
