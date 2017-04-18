class InputValue
  class Cell
    class EditTruckBlock < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey

      def show
        render(html: slow_select_with_input_values)
      end

      def truck_select_pairs
        trucks_without_current.order(created_at: :desc).map do |truck|
          [truck.number_plate, truck.id]
        end.prepend([model.number_plate, model.id])
      end

      def trucks_without_current
        @trucks_without_current ||= ::Truck.where.not(id: model.id)
      end

      def driver_select_pairs
        drivers_without_current.order(created_at: :desc).map do |driver|
          [driver.full_name, driver.id]
        end.prepend([model.driver.full_name, model.driver_id])
      end

      def drivers_without_current
        @drivers_without_current ||= ::Driver.where.not(id: model.driver_id)
      end

      def form_select_clients
        @form_select_clients ||= ::Client.all.order(created_at: :desc).map do |client|
          [client.full_name, client.id]
        end
      end

      def date
        @date ||= (params[:date]&.to_time || Time.current)
      end

      def form_object
        @form_object ||= params[:form_object]
      end

      def slow_select_with_input_values
        exist_client_ids = []
        res = ''
        Client.joins(inputs: :input_values).where(input_values: {id: model.input_values.ids, updated_at: date}).each do |client|
          res << concept('input_value/cell/client_select_with_inputs',
                         client,
                         form_object: form_object,
                         date: date,
                         exist_client_ids: exist_client_ids).show
         res << concept('input_value/cell/client_inputs_input_values_fields',
                         nil,
                         form_object: form_object,
                         date: date).show
          exist_client_ids << client.id
        end
        res << concept('input_value/cell/client_select',
                       nil,
                       form_object: form_object,
                       date: date,
                       exist_client_ids: exist_client_ids).show
        res
      end
    end
  end
end
