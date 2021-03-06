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

      def drivers_select_options
        res = ''
        res << content_tag(:option, current_driver.full_name, value: current_driver.id)
        drivers.where.not(id: current_driver).inject(res) do |acc, driver|
          acc << content_tag(:option, driver.full_name, value: driver.id)
        end
      end

      def destroy
        link_to(image_tag('delete_row'), truck_path(model), class: 'js-delete-truck')
      end
    end
  end
end
