class Driver
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper
      include TrailblazerHelpers::Cells::UniqKey
    end
  end
end
