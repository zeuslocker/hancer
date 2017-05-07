class Point
  class Cell
    class New < Trailblazer::Cell
      include ::SimpleForm::ActionViewExtensions::FormHelper
      include ActionView::Helpers::FormHelper
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject
    end
  end
end
