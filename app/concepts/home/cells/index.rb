module Home
  module Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('home/cell/navbar', nil)
      end
    end
  end
end
