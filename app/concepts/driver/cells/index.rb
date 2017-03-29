class Driver
  class Cell
    class Index < Trailblazer::Cell
      def show_drivers
        concept('driver/cell/show', collection: model)
      end
    end
  end
end
