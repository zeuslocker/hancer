module TrailblazerHelpers
  module Steps
    module Client
      class SetupModelClient
        extend Uber::Callable

        def self.call(options, params:, **)
          options['model'] = ::Client.find(params[:id])
        end
      end
    end
  end
end
