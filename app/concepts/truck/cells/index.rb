class Truck
  class Cell
    class Index < Trailblazer::Cell
      def show_trucks
        concept('truck/cell/show', collection: model['trucks'], drivers: model['drivers'])
      end

      def navbar
        concept('truck/cell/navbar', nil)
      end

      def new_truck_form
        concept('truck/cell/new', model)
      end
    end
  end
end
