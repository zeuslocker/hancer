class InputValue
  class Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('input_value/cell/navbar', params.fetch(:date, Time.current).to_time.strftime('%Y-%m-%d'))
      end

      def show_truck_blocks
        concept('input_value/cell/truck_block', collection: model['model'], params: params)
      end
    end
  end
end
