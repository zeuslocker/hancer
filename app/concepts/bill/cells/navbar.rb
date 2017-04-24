class InputValue
  class Cell
    class Navbar < Trailblazer::Cell
      include ActionView::Helpers::DateHelper

      def navbar
        concept('bill/cell/navbar', params.fetch(:date, Time.current).to_time.strftime('%Y-%m-%d'))
      end
    end
  end
end
