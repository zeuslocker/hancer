class Point
  class Cell
    class Index < Trailblazer::Cell
      include TrailblazerHelpers::Cells::ResultObject
      include TrailblazerHelpers::Cells::UniqKey
      def show_points
        concept('point/cell/show', collection: result['points'])
      end

      def new_points_form
        concept('point/cell/new', model)
      end

      def navbar
        concept('point/cell/navbar', nil)
      end
    end
  end
end
