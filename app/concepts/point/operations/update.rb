class Point
  class Update < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract Point::Contract::PointForm

    step Model(::Point, :find_by)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
