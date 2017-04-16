class InputValue
  class Cell
    class NewClientSelect < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def show
        render(text: '') && return if form_select_clients.empty?
        super
      end

      def index
        SecureRandom.hex(10)
      end

      def form_select_clients
        @form_select_clients ||= ::Client.where.not(id: params[:client_ids]).order(created_at: :desc).map do |client|
          [client.full_name, client.id]
        end
        if current_client
          @form_select_clients - [current_client.full_name, current_client.id]
          @form_select_clients.prepend( [current_client.full_name, current_client.id] )
        end
        @form_select_clients
      end

      def client
        ::Client.new
      end

      def form_object
        params[:form_object]
      end

      def current_client
        @current_client = options[:current_client]
      end
    end
  end
end
