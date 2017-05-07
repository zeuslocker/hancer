module TrailblazerHelpers
  module Cells
    module Index
      # conditions
      def its_point_input?(f)
        current_input(f).name == I18n.t('client.form.points_for_form') && current_client(f).points
      end

      def date
        @date ||= params[:date].present? ? params[:date].to_date : Time.current.to_date
      end

      def its_franktnr_input?(f)
        current_input(f).name == I18n.t('client.form.fraktnr_low_case') && current_client(f).fraktnr
      end

      def destroy(id)
        link_to(image_tag('delete_row.png'), destroy_collection_input_values_path, date: id, class: 'js-delete-model-row-inlut-value pr-20')
      end

      def client_identificator
        ::SecureRandom.hex(10)
      end

      def its_simple_input?(f)
        (current_input(f).name != I18n.t('client.form.points_for_form') &&
        current_input(f).name != I18n.t('client.form.fraktnr_low_case'))
      end
    end
  end
end