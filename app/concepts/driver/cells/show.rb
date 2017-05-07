class Driver
  class Cell
    class Show < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
      
      def full_name
        content_tag :input, nil, type: 'text', value: model.full_name,
                                 name: 'Full name', class: 'driver-box__input driver-box__text'
      end

      def destroy
        link_to(image_tag('delete_row.png'), driver_path(model), class: 'js-delete-driver')
      end

      def driver_id_field(f)
        f.hidden_field(:id)
      end
    end
  end
end
