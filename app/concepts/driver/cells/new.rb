class Driver
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper
      include Cell::Haml
    end
  end
end
