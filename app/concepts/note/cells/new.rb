class Note
  class Cell
    class New < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def form_select_trucks
        trucks_without_current.order(created_at: :desc).map do |truck|
          [truck.number_plate, truck.id]
        end.prepend([model.truck_number_plate, model.truck_id])
      end

      def form_select_drivers
        drivers_without_current.order(created_at: :desc).map do |driver|
          [driver.full_name, driver.id]
        end.prepend([model.truck.driver.full_name, model.truck.driver.id])
      end

      def form_select_clients
        ::Client.all.order(created_at: :desc).map do |client|
          [client.full_name, client.id]
        end
      end

      def form_identifier
        model.id || options[:index]
      end
      def drivers_without_current
        ::Driver.where.not(id: model.truck_driver_id)
      end

      def trucks_without_current
        ::Truck.where.not(id: model.truck_id)
      end

      def note_id
        model.id || 'new'
      end
    end
  end
end
