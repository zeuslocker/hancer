class Truck
  class Cell
    class Show < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      delegate :number_plate, to: :model

      def drivers
        options[:drivers]
      end

      def current_driver
        model.driver
      end

      def destroy
        link_to(image_tag('delete_row.png'), truck_path(model), class: 'js-delete-truck')
      end
    end
  end
end
