class InputValue
  class Cell
    class InputFields < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def date
        @date ||= params[:date].to_time
      end

      def input_values
        @input_values ||= model['input_values']
      end

      def client
        @client ||= model['client']
      end

      def form_object
        @form_object ||= params[:form_object]
      end
    end
  end
end
