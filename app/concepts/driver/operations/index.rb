class Driver
  class Index < Trailblazer::Operation
    step Nested(::Driver::New)
    step TrailblazerHelpers::Steps::Driver::SetupDrivers
    step :order_drivers
    
    def order_drivers(options, **)
      options['drivers'].order!(created_at: :desc)
    end
  end
end
