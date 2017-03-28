class Driver
  class Cell
    class Show < Trailblazer::Cell
      def full_name
        model.full_name
      end
    end
  end
end
