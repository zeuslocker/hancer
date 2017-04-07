class Truck
  class Cell
    class Index < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper

      def show_trucks
        concept('truck/cell/show', collection: model['trucks'], drivers: model['drivers'])
      end

      def navbar
        concept('truck/cell/navbar', nil)
      end

      def new_truck_form
        concept('truck/cell/new', model)
      end

      def new_truck_key
        @new_truck_key ||= SecureRandom.hex(10)
      end

      def form_driver_options
        ::Driver.all.collect{|x| [x.full_name, x.id]}
      end

      def destroy
        link_to(image_tag('delete_row'), truck_path(model), class: 'js-delete-driver')
      end
    end
  end
end
