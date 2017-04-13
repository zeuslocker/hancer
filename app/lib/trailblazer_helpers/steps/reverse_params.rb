module TrailblazerHelpers
  module Steps
    class ReverseParams
      extend Uber::Callable

      def self.call(_options, params:, **)
        models = params[:controller].to_sym
        params[models] = HashWithIndifferentAccess.new(params[models].to_a.reverse.to_h)
      end
    end
  end
end
