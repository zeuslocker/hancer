class Point
  class New < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract Point::Contract::PointForm

    step Model(::Point, :new)
    step ::Trailblazer::Operation::Contract::Build()
  end
end
