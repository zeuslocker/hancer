class Note
  class Cell
    class New < Trailblazer::Cell
      def trucks
        ::Truck.all
      end

      def notes

      end
    end
  end
end
