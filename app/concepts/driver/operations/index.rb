class Driver
  class Index < Trailblazer::Operation
    step Nested(::Driver::New)
    step TrailblazerHelpers::Steps::Driver::SetupDrivers
  end
end
