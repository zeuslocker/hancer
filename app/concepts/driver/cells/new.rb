class Driver
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper

      def new_key
        @new_key ||= SecureRandom.hex(10)
      end
    end
  end
end
