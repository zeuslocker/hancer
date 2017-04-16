class InputValue
  class Cell
    class NewTruckBlock < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey
      def form_select_trucks
        trucks_without_current.order(created_at: :desc).map do |truck|
          [truck.number_plate, truck.id]
        end.prepend([truck.number_plate, truck.id])
      end

      def trucks_without_current
        @trucks_without_current ||= ::Truck.where.not(id: truck.id)
      end

      def form_select_clients
        @form_select_clients ||= ::Client.all.order(created_at: :desc).map do |client|
          [client.full_name, client.id]
        end
      end

      def form_select_drivers
        drivers_without_current.order(created_at: :desc).map do |driver|
          [driver.full_name, driver.id]
        end.prepend([truck.driver.full_name, truck.driver_id])
      end

      def show_input_values
        res = ''
      ::Client.joins(inputs: :input_values).uniq.each do |client|
        res << concept('input_value/cell/new_client_select', nil,
                      form_object: "trucks[#{truck_index}][clients][#{new_key}]",
                      current_client: client).show
        res << concept('input_value/cell/new_client_selec', nil,
                      form_object: "trucks[#{truck_index}][clients][#{new_key}]",
                      current_client: client).show
        end
        res
      end

      def drivers_without_current
        @drivers_without_current ||= ::Driver.where.not(id: truck.driver_id)
      end

      def truck_index
        @index ||= options[:index]
      end

      def truck
        @truck ||= options[:truck]
      end
    end
  end
end
