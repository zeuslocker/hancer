class Point
  class Destroy < Trailblazer::Operation
    step Model(::Point, :find)
    step ::TrailblazerHelpers::Steps::Destroy
  end
end
