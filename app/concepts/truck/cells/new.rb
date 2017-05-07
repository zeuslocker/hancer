class Truck
  class Cell
    class New < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject

      def form_driver_options
        result['drivers'].collect { |x| [x.full_name, x.id] }
      end
    end
  end
end
