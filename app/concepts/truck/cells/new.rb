class Truck
  class Cell
    class New < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def form_driver_options
        ::Driver.includes(:truck).where(trucks: {driver_id: nil}).collect { |x| [x.full_name, x.id] }
      end

      def new_truck_key
        @new_truck_key ||= SecureRandom.hex(10)
      end
    end
  end
end
