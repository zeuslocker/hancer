module TrailblazerHelpers
  module Steps
    module Client
      class SetupClients
        extend Uber::Callable

        def self.call(options, **)
          options['clients'] = ::Client.all.order(created_at: :desc)
        end
      end
    end
  end
end
