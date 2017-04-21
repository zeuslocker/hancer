class InputValue
  class Cell
    class Index < Trailblazer::Cell
      include ::ActionView::Helpers::FormOptionsHelper
      attr_reader :client, :used_clients

      def show
        @used_clients = []
        super
      end

      def truck_select_pairs
        options_from_collection_for_select(::Truck.all, :id, :number_plate)
      end

      def driver_select_pairs
        options_from_collection_for_select(::Driver.all, :id, :full_name)
      end

      def date
        @date ||= (params[:date]&.to_time || Time.current)
      end

      def navbar
        concept('input_value/cell/navbar', params.fetch(:date, Time.current).to_time.strftime('%Y-%m-%d'))
      end

      def all_clients(ff)
        @clients ||= Client.joins(:inputs).where(inputs:{id: ff.object.input_values.map(&:input_id)}).uniq
      end

      def curren_client(ff)
        ff.object.model.input.client
      end

      def edit_truck_block_link
        link_to nil, edit_truck_block_input_values_path, class: 'input_client-inputs-field_link hidden'
      end

      def truck_input_values_form
        @truck_input_values_form ||= model['contract.default']
      end
    end
  end
end
