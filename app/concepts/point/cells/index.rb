class Point
  class Cell
    class Index < Trailblazer::Cell
      def show_points
        concept('point/cell/show', collection: model['points'])
      end

      def new_points_form
        concept('point/cell/new', model['model'])
      end

      def navbar
        concept('point/cell/navbar', nil)
      end

      def new_point_key
        @new_point_key ||= SecureRandom.hex(10)
      end
    end
  end
end
