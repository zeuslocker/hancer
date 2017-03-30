class Truck
  class Index < Trailblazer::Operation
    step :setup_trucks!
    step TrailblazerHelpers::Steps::Driver::SetupDrivers

    def setup_trucks!(options, **)
      options['trucks'] = ::Truck.all
    end
  end
end
