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

      def create_new_row_if_no_space(index)
        index != 0 && index % 6 == 0 ? '</div><div class="row driver-box__bgtruck_withoutborder">'.html_safe : nil
      end

      def form_object
        @form_object ||= params[:form_object]
      end

      def clients
        @clients ||= ::Client.where(id: params[:client_ids])&.order_as_specified(id: params.fetch(:client_ids, []))
      end

      def truck
        @truck ||= ::Truck.find(params[:truck_id])
      end

      def truck_input_values
        @input_values ||= truck.input_values.where(date: date.midnight..date.end_of_day)
      end

      def input_value_exist?(_f, input)
        truck_input_values.find_by(input_id: input.id)
      end
      # HTML Helpers

      def komment_field_tag(f, client, indent)
        col_size = 9 - client.inputs.length
        col_size += 1 unless client.fraktnr
        client.points ? col_size -= 1 : col_size += 1
        col_size = 1 if col_size < 1
        content_tag :div, class: "col-sm-#{col_size}" do
          komment_field_tag_inner_html(f, client, indent)
        end
      end

      def komment_field_tag_inner_html(f, client, indent)
        div_res = ''
        input = client.inputs.find_by(name: 'kommentar')
        div_res << text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", input_value_exist?(f, input)&.value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
        div_res << input_id_hidden_tag(input, indent)
        div_res << date_hidden_tag(indent)
        div_res << input_value_hidden_id_tag(f, input, indent) if input_value_exist?(f, input)
        div_res.html_safe
      end

      def any_client_input_values_persist?(client)
        truck_input_values.joins(:input).where(inputs: { client_id: client.id }).present?
      end

      def remove_new_row(id)
        link_to(image_tag('delete_row.png'), nil, class: 'js-delete-new-row-inlut-value pr-20', date: id)
      end

      def truck_select_tag(f)
        f.select(:id,
                 options_for_select([[f.object.number_plate, f.object.id]]),
                 {},
                 class: 'form-control form-box__select form-box__select_blue truck_id')
      end

      def driver_select_tag(f)
        f.select(:driver_id, options_from_collection_for_select(::Driver::Index.call['drivers'], :id, :full_name, f.object.driver_id),
                 {},
                 class: 'form-control form-box__select form-box__select_blue driver_id')
      end

      def client_select_tag(client)
        if any_client_input_values_persist?(client)
          select_tag('client_ids[]',
                     options_from_collection_for_select(::Client.where.not(id: clients.ids - [client.id]), :id, :full_name, client.id),current_val: client.id,
                     class: 'form-control form-box__select form-box__select_white-blue-dnormal js-render-new-client-with-alert')
        else
          select_tag('client_ids[]',
                     options_from_collection_for_select(::Client.where.not(id: clients.ids - [client.id]), :id, :full_name, client.id),
                     class: 'form-control form-box__select form-box__select_white-blue-dnormal js-render-new-client')
        end
      end

      def fraktnr_text_tag(f, input, indent)
        res = ''
        input_value = input_value_exist?(f, input)
        res << date_hidden_tag(indent)
        res << input_id_hidden_tag(input, indent)
        if input_value
          res << input_value_hidden_id_tag(f, input, indent)
          res << text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", input_value.value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
        else
          res << text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", nil, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
        end
        res
      end

      def points_select_tag(f, client, indent)
        res = ''
        input = client.inputs.points
        input_value = input_value_exist?(f, input)
        res << date_hidden_tag(indent)
        res << input_id_hidden_tag(input, indent)
        if input_value
          res << input_value_hidden_id_tag(f, input, indent)
          res << select_tag("#{form_object}[input_values_attributes][#{indent}][value]", options_from_collection_for_select(::Point.all, :id, :name, input_value.value), class: 'driver-box__input driver-box__text driver-box__select_mini', placeholder: input.name.to_s)
        else
          res << select_tag("#{form_object}[input_values_attributes][#{indent}][value]", options_from_collection_for_select(::Point.all, :id, :name), class: 'driver-box__input driver-box__text driver-box__select_mini', placeholder: input.name.to_s, include_blank: I18n.t('client.form.points_blank'))
        end
        res
      end

      def sipmle_input_value_tag(f, input, indent)
        res = ''
        res << date_hidden_tag(indent)
        res << input_id_hidden_tag(input, indent)
        res << text_field_tag("#{form_object}[input_values_attributes][#{indent}][value]", input_value_exist?(f, input)&.value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: input.name.to_s)
        if input_value_exist?(f, input)
          res << input_value_hidden_id_tag(f, input, indent)
        end
        res
      end

      def date_hidden_tag(indent)
        hidden_field_tag("#{form_object}[input_values_attributes][#{indent}][date]", params[:date])
      end

      def input_value_hidden_id_tag(f, input, indent)
        hidden_field_tag("#{form_object}[input_values_attributes][#{indent}][id]", input_value_exist?(f, input)&.id, {date: input.client_id})
      end

      def input_id_hidden_tag(input, indent)
        hidden_field_tag("#{form_object}[input_values_attributes][#{indent}][input_id]", input.id)
      end

      def select_for_new_client_tag
        select_tag('client_ids[]', options_from_collection_for_select(::Client.where.not(id: used_clients), :id, :full_name), class: 'form-control form-box__select form-box__select_white-blue-dnormal js-render-client-fields', include_blank: I18n.t('client.form.clients_blank'))
      end
    end
  end
end
