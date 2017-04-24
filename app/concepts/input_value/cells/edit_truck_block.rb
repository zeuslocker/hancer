require_relative '../../../lib/trailblazer_helpers/cells/input_value/index'
class InputValue
  class Cell
    class EditTruckBlock < Trailblazer::Cell
      include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include ActionView::Helpers::OutputSafetyHelper
      include TrailblazerHelpers::Cells::UniqKey
      include ::TrailblazerHelpers::Cells::Index
      attr_accessor :used_clients

      def show
        @used_clients = []
        @new_row = true
        super
      end

      def client_identificator
        ::SecureRandom.hex(10)
      end

      def form_object
        @form_object ||= params[:form_object]
      end

      def clients
        @clients ||= ::Client.where(id: params[:client_ids]).order_as_specified(id: params[:client_ids])
      end

      def truck
        @truck ||= ::Truck.find(params[:truck_id])
      end

      def input_value_exist?(f, input)
        f.object.input_values.find_by(input_id: input.id)
      end
      # HTML Helpers

      def remove_new_row
        link_to(image_tag('delete_row.png'), nil, class: 'js-delete-new-row')
      end

      def truck_select_tag(f)
        f.select(:id,
                 options_from_collection_for_select(::Truck::Index.call['trucks'], :id, :number_plate, f.object.id),
                 {},
                 class: 'form-control form-box__select form-box__select_blue truck_id')
      end

      def driver_select_tag(f)
        f.select(:driver_id, options_from_collection_for_select(::Driver::Index.call['drivers'], :id, :full_name, f.object.driver_id),
                 {},
                 class: 'form-control form-box__select form-box__select_blue driver_id')
      end

      def client_select_tag(client)
        select_tag('client_ids[]',
                   options_from_collection_for_select(::Client.all, :id, :full_name, client.id),
                   class: 'form-control form-box__select form-box__select_white-blue-mr js-render-client-fields', disabled: true)
      end

      def fraktnr_text_tag(f, input, indent)
        text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", input_value_exist?(f, input)&.value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
      end

      def points_select_tag(input, indent)
        select_tag("#{form_object}[input_values_attributes][#{indent}][value]", options_from_collection_for_select(::Point.all, :id, :name), class: 'driver-box__input driver-box__text driver-box__select_mini', placeholder: input.name.to_s, include_blank: I18n.t('client.form.points_blank'))
      end

      def sipmle_input_value_tag(f, input, indent)
        text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", input_value_exist?(f, input)&.value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
      end

      def input_value_hidden_id_tag(f, input, indent)
        hidden_field_tag("#{form_object}[input_values_attributes][#{indent}][id]", input_value_exist?(f, input)&.id)
      end

      def input_id_hidden_tag(input, indent)
        hidden_field_tag("#{form_object}[input_values_attributes][#{indent}][input_id]", input.id)
      end

      def select_for_new_client_tag
        select_tag('client_ids[]', options_from_collection_for_select(::Client.where.not(id: used_clients), :id, :full_name), class: 'form-control form-box__select form-box__select_white-blue-mr js-render-client-fields', include_blank: I18n.t('client.form.clients_blank'))
      end
    end
  end
end
