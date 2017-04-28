class Admin
  module Contract
    class AdminForm < ::Reform::Form
      collection :trucks, populator: :populate_trucks do
        def prepopulate!(options)
          index = 0
          result = []
          Client.joins(:input_values).where(
              input_values: { date: options[:date].midnight..options[:date].end_of_day, id:
                            input_values.map(&:model)
                                              .map(&:id) }
          ).uniq.order(:updated_at).each do |client|
            client.inputs.each do |input|
              input_value = input_values.find { |x| x.input_id == input.id && x.date >= options[:date].midnight && x.date <= options[:date].end_of_day }
              if input.name == I18n.t('client.form.fraktnr_low_case') && input.client.fraktnr
                result << (input_value&.model || ::InputValue.new(input_id: input.id))
              elsif input.name == I18n.t('client.form.points_for_form') && input.client.points
                result << (input_value&.model || ::InputValue.new(input_id: input.id))
              elsif (input.name != I18n.t('client.form.points_for_form')) && (input.name != I18n.t('client.form.fraktnr_low_case')) && (input.name != I18n.t('input_value.kommentar'))
                result << (input_value&.model || ::InputValue.new(input_id: input.id))
              end
            end
          end
          input_values.clear
          result.each do |x|
            input_values << x
          end
        end
        ::Truck.attribute_names.each { |col| property col.to_sym }
        validates :id, :driver_id, presence: true

        collection :input_values, populator: :populate_input_values do
          properties :value, :input_id, :date
          validates :value, :input_id, presence: true
        end

        def populate_input_values(fragment:, **)
          return skip! if !fragment[:value] || fragment[:value].empty?
          item = fragment[:id] && input_values.find_by(id: fragment[:id])
          item || input_values.append(InputValue.new(date: fragment[:date].to_time))
        end
      end

      def populate_trucks(fragment:, **)
        trucks.find_by(id: fragment[:id])
      end
    end
  end
end
