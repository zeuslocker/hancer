class Driver
  class Cell
    class FlashTmp < Trailblazer::Cell
      def flash
        parent_controller.flash
      end
    end
  end
end
