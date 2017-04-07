module TrailblazerHelpers
  module Steps
    module Point
      class SetupPoints
        extend Uber::Callable

        def self.call(options, **)
          options['points'] = ::Point.all
        end
      end
    end
  end
end
