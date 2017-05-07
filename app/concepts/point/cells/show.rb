class Point
  class Cell
    class Show < Trailblazer::Cell
      def full_name
        content_tag :input, nil, type: 'text', value: model.full_name,
                                 name: 'Full name', class: 'driver-box__input driver-box__text'
      end

      def destroy
        link_to(image_tag('delete_row.png'), point_path(model), class: 'js-delete-point')
      end
    end
  end
end
