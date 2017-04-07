class Point
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper

      def new_point_key
        @new_point_key ||= SecureRandom.hex(10)
      end
    end
  end
end
