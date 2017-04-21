class InputValue
  class Cell
    class EditTruckBlock < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey
      attr_accessor :used_clients

      def show
        @used_clients = []
        super
      end

      def date
        @date ||= (params[:date]&.to_time || Time.current)
      end

      def client_identificator
        ::SecureRandom.hex(10)
      end

      def form_object
        @form_object ||= params[:form_object]
      end

      def clients
        @clients ||= ::Client.where(id: params[:client_ids]).order_as_specified(id: params[:client_ids])
      end

      def truck
        @truck ||= ::Truck.find(params[:truck_id])
      end

      def slow_select_with_input_values

      end
    end
  end
end
