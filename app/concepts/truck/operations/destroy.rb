class Truck
  class Destroy < Trailblazer::Operation
    step Model(::Truck, :find)
    step TrailblazerHelpers::Steps::Destroy
  end
end
