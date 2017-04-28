class Driver
  class Cell
    class Index < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey

      def show_drivers
        concept('driver/cell/show', collection: model['drivers'])
      end

      def new_driver_form
        concept('driver/cell/new', model['model'])
      end

      def navbar
        concept('driver/cell/navbar', nil)
      end
    end
  end
end
