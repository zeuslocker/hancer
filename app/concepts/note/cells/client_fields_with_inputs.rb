class Note
  class Cell
    class ClientFieldsWithInputs < Trailblazer::Cell
      def show
        inputs_values
      end

      def inputs_values
        result = ''
        model.each_with_index do |input, index|
          result.tap do |result|
            result << concept('note/cell/client_value', input, params: params, index: index, layout: false).show
          end
        end
        result
      end
    end
  end
end
