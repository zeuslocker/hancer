class InputValue
  class Cell
    class ClientInputsInputValuesFields < Trailblazer::Cell
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
    end
  end
end
