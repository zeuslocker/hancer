class Driver
  class Cell
    class Index < Trailblazer::Cell
      def show_drivers
        concept('driver/cell/show', collection: model['drivers'])
      end

      def new_driver_form
        concept('driver/cell/new', model['model'])
      end

      def navbar
        concept('driver/cell/navbar', nil)
      end

      def new_driver_key
        @new_driver_key ||= SecureRandom.hex(10)
      end
    end
  end
end
