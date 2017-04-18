class InputValue
  class Cell
    class ClientSelect < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def form_object
        @form_object ||= options[:form_object]
      end

      def date
        @date ||= options[:date]
      end

      def exist_client_ids
        @exist_client_ids ||= options[:exist_client_ids]
      end

      def index
        SecureRandom.hex(10)
      end

      def show
        render(text: '') && return if clients_select_pairs.empty?
        super
      end

      def clients_select_pairs
        @form_select_clients ||= ::Client.where.not(id: exist_client_ids).order(created_at: :desc).map do |client|
          [client.full_name, client.id]
        end
        if model
          @form_select_clients - [model.full_name, model.id]
          @form_select_clients.prepend( [model.full_name, model.id] )
        end
        @form_select_clients
      end
    end
  end
end
