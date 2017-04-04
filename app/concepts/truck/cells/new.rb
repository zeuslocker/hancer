class Truck
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper
      include  ActionView::Helpers::FormOptionsHelper
      def form_driver_options
        ::Driver.all.collect{|x| [x.full_name, x.id]}
      end
    end
  end
end
