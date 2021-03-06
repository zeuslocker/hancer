class Truck
  class New < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL
    
    contract Truck::Contract::TruckForm

    step Model(::Truck, :new)
    step ::Trailblazer::Operation::Contract::Build()
  end
end
