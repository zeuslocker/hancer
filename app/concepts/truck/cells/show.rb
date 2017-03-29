class Truck
  module Cell
    class Show < Trailblazer::Cell
      def number_plate
        model.number_plate
      end
    end
  end
end
