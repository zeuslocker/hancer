class Truck
  module Cell
    class Index < Trailblazer::Cell
      def show_trucks
        concept('truck/cell/show', collection: model['trucks'])
      end
    end
  end
end
