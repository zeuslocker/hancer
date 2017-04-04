class Driver
  class Cell
    class Index < Trailblazer::Cell
      def show_drivers
        concept('driver/cell/show', collection: model['drivers'])
      end

      def flash_messages
        concept('driver/cell/flash_tmp', nil)
      end

      def new_driver_form
        concept('driver/cell/new', model['model'])
      end

      def navbar
        concept('driver/cell/navbar', nil)
      end

      def flash
        parent_controller.flash
      end
    end
  end
end
