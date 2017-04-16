class InputValue
  class Cell
    class ClientFieldsWithInputs < Trailblazer::Cell
      include ::ActionView::Helpers::OutputSafetyHelper
      def input_values
        @input_values ||= model['input_values']
      end

      def client
        @client ||= model['client']
      end

      def form_object
        @form_object ||= params[:form_object]
      end

      def date
        @date ||= params[:date].to_time
      end

      def input_fraktnr
        @fraktnr = client.inputs.find_by(name: 'fraktnr')
      end

      def input_points
        @points = client.inputs.find_by(name: 'points')
      end

      def find_input_value(input)
        input.input_values.find_by(truck_id: params[:truck_id],
                                   driver_id: params[:driver_id],
                                   updated_at: date.midnight..date.end_of_day)
      end

      def show_default_fields
        res = ''
          if client.fraktnr
            res << raw(render(view: 'input_fields', locals: {
                                                        input: input_fraktnr,
                                                        form_object: form_object,
                                                        find_input_value: find_input_value(input_fraktnr),
                                                        optional_class: 'col-sm-2'}))
          end
        res
      end

      def show_input_fields
        ''.tap do |res|
          res << show_default_fields
          client.inputs.without_default.each_with_index do |input, index|
            res << render(view: 'input_fields', locals: {
                                                        input: input,
                                                        form_object: form_object,
                                                        find_input_value: find_input_value(input)})
          end
        end
      end
    end
  end
end
