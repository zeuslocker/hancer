class Point
  class Index < Trailblazer::Operation
    step Nested(::Point::New)
    step TrailblazerHelpers::Steps::Point::SetupPoints
    step :order_points

    def order_points(options, **)
      options['points'].order!(created_at: :desc)
    end
  end
end
