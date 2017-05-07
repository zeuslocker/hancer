class Driver
  class Cell
    class Index < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject

      def show_drivers
        concept('driver/cell/show', collection: result['drivers'])
      end

      def new_driver_form
        concept('driver/cell/new', nil, result: result)
      end

      def navbar
        concept('driver/cell/navbar', nil)
      end
    end
  end
end
