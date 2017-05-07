class Truck
  class Cell
    class Index < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject

      def show_trucks
        concept('truck/cell/show', collection: result['trucks'], drivers: result['drivers'])
      end

      def navbar
        concept('truck/cell/navbar', nil)
      end

      def new_truck_form
        concept('truck/cell/new', model, result: result)
      end

      def form_driver_options
        result['drivers'].collect { |x| [x.full_name, x.id] }
      end

      def destroy
        link_to(image_tag('delete_row.png'), truck_path(model), class: 'js-delete-driver')
      end
    end
  end
end
