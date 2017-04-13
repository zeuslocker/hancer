class Note
  class Cell
    class New < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def form_select_trucks
        result = ::Truck.where.not(id: model.truck_id).order(created_at: :desc).collect { |truck| [truck.number_plate, truck.id] }
        result.prepend([model.truck_number_plate, model.truck_id])
        result
      end

      def form_select_drivers
        result = ::Driver.where.not(id: model.truck_driver_id).order(created_at: :desc).collect { |driver| [driver.full_name, driver.id] }
        result.prepend([model.truck.driver.full_name, model.truck.driver.id])
        result
      end

      def drivers_select_options
        res = ''
        res << content_tag(:option, current_driver.full_name, value: current_driver.id)
        other_drivers.inject(res) do |acc, driver|
          acc << content_tag(:option, driver.full_name, value: driver.id)
        end
      end
    end
  end
end
