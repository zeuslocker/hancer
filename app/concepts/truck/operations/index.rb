class Truck
  class Index < Trailblazer::Operation
    step :setup_trucks!

    def setup_trucks!(options, **)
      options['trucks'] = ::Truck.all
    end
  end
end
