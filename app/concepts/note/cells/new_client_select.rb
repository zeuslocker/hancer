class Note
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
      end

      def client
        ::Client.new
      end

      def form_object
        params[:form_object]
      end
    end
  end
end
