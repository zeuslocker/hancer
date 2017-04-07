require_relative 'new'
class Truck
  class Index < Trailblazer::Operation
    step :setup_trucks!
    step Nested(::Truck::New)
    step TrailblazerHelpers::Steps::Driver::SetupDrivers

    def setup_trucks!(options, **)
      options['trucks'] = ::Truck.all.order(created_at: :desc)
    end
  end
end
