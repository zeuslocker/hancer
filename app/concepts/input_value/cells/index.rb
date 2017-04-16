class InputValue
  class Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('input_value/cell/navbar', params.fetch(:date, Time.current).strftime('%Y-%m-%d'))
      end

      def new_client_fields_with_inputs_link
        link_to nil, client_fields_with_inputs_input_values_path, class: 'input_client-inputs-field_link hide'
      end

      def new_client_select_notes_link
        link_to nil, new_client_select_input_values_path, class: 'new-client-select-link hide'
      end

      def show_truck_input_values
        ''.tap do |result|
          model['trucks'].order(created_at: :desc).each_with_index do |truck, index|
            form_model = model['input_values'].where(truck_id: truck.id, driver_id: truck.driver_id)
            result << concept('input_value/cell/new_truck_block', form_model, truck: truck, index: index).show
          end
        end
      end
    end
  end
end
