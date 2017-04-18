class InputValue
  class Cell
    class ClientSelectWithInputs < Trailblazer::Cell
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

      def show_select
        concept('input_value/cell/client_select',
                model,
                form_object: form_object,
                date: date,
                exist_client_ids: exist_client_ids)
      end

      def show
        render html: show_select
      end
    end
  end
end
