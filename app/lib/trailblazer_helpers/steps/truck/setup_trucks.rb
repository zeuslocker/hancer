module TrailblazerHelpers
  module Steps
    module Truck
      class SetupTrucks
        extend Uber::Callable

        def self.call(options, **)
          options['trucks'] = ::Truck.all
        end
      end
    end
  end
end
