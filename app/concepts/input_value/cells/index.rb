require_relative '../../../lib/trailblazer_helpers/cells/input_value/index'
class InputValue
  class Cell
    class Index < Trailblazer::Cell
      include ::ActionView::Helpers::FormOptionsHelper
      attr_reader :client, :used_clients
      include ::TrailblazerHelpers::Cells::Index

      def show
        @used_clients = []
        model['contract.default'].prepopulate!(date: date)
        super
      end

      def destroy
        link_to(image_tag('delete_row.png'), client_path(model), class: 'js-delete-model')
      end

      def truck_select_pairs
        options_from_collection_for_select(::Truck.all, :id, :number_plate)
      end

      def driver_select_pairs
        options_from_collection_for_select(::Driver.all, :id, :full_name)
        # Client.joins(inputs: :input_values).where(inputs:{ input_values:{id: self.input_values.map(&:model).map(&:id)}}).ids
      end

      def navbar
        concept('input_value/cell/navbar', params.fetch(:date, Time.current).to_time.strftime('%Y-%m-%d'))
      end

      def all_clients(f)
        @clients ||= Client.joins(:inputs).where(inputs: { id: f.object.input_values.map(&:input_id) }).uniq
      end

      def current_client(f)
        ::Input.find(f.object.model.input_id).client
      end

      def next_input_value(f, truck_f)
        index = truck_f.object.input_values.find_index { |x| (x.id == f.object.id) && (x.input_id == f.object.input_id) }
        truck_f.object.input_values[index + 1]
      end

      def edit_truck_block_link
        link_to nil, edit_truck_block_input_values_path, class: 'input_client-inputs-field_link hidden'
      end

      def truck_input_values_form
        @truck_input_values_form ||= model['contract.default']
      end

      def current_input(f)
        f.object.model.input
      end

      # HTML Helpers
      def input_value_tag(f)
        res = f.text_field(:value, class: 'driver-box__input driver-box__text driver-box__input_mini', placeholder: current_input(f).name.to_s)
        res << f.hidden_field(:input_id)
        res << f.hidden_field(:id) if f.object.model.id
        res
      end

      def points_select_tag(f)
        current_point = ::Point.find_by(id: f.object.model&.value)&.id
        res = f.select(:value, options_from_collection_for_select(::Point.all, :id, :name, current_point), { prompt: 'Please select' }, class: 'driver-box__input driver-box__text driver-box__select_mini')
        res << f.hidden_field(:input_id)
        res << f.hidden_field(:id) if f.object.model.id
        res
      end

      def driver_select_tag(f)
        f.select(:driver_id, options_from_collection_for_select(::Driver::Index.call['drivers'], :id, :full_name, f.object.driver_id), {},
                 class: 'form-control form-box__select form-box__select_blue driver_id')
      end

      def truck_select_tag(f)
        f.select(:id,
                 options_from_collection_for_select(::Truck::Index.call['trucks'], :id, :number_plate, f.object.id),
                 {},
                 class: 'form-control form-box__select form-box__select_blue truck_id')
      end

      def client_select_tag(f)
        select_tag('client_ids[]',
                   options_from_collection_for_select(::Client.all, :id, :full_name, f.object.model.input.client_id),
                   class: 'form-control form-box__select form-box__select_white-blue-mr js-render-client-fields', disabled: true)
      end
    end
  end
end
