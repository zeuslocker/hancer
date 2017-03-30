class Truck
  module Cell
    class Index < Trailblazer::Cell
      def show_trucks
        concept('truck/cell/show', collection: model['trucks'], drivers: model['drivers'])
      end
    end
  end
end
