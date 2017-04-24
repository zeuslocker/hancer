class Bill
  module Cell
    class Navbar < Trailblazer::Cell
      include ActionView::Helpers::DateHelper

      def all_month
        ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      end
    end
  end
end
