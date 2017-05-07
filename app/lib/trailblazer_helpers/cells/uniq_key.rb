module TrailblazerHelpers
  module Cells
    module UniqKey
      def new_key
        @new_key ||= SecureRandom.hex(10)
      end
    end
  end
end
