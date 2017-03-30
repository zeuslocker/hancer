module TrailblazerHelpers
  module Steps
    module Driver
      class SetupDrivers
        extend Uber::Callable

        def self.call(options, **)
          options['drivers'] = ::Driver.all
        end
      end
    end
  end
end
