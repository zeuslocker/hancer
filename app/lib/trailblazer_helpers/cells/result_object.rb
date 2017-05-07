module TrailblazerHelpers
  module Cells
    module ResultObject
      def result
        @result ||= options[:result]
      end
    end
  end
end
