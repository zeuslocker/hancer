class Bill
  module Cell
    class Show < Trailblazer::Cell
      attr_accessor :total_sums

      def client_inputs
        return @inputs if @inputs
        inputs = model.inputs
        inputs = inputs.where.not(name: I18n.t('client.form.fraktnr_low_case')) unless model.fraktnr
        inputs = inputs.where.not(name: I18n.t('client.form.points_for_form')) unless model.points
        @inputs ||= inputs
      end

      def sums
        @total_sums
      end

      def input_values_for_each_truck
        @total_sums = Array.new(client_inputs.length - row_franktnt_points_inputs_length + 1, 0)
        res = [].tap do |result|
          (date_beginning_of_month..date_end_of_month).each do |date|
            input_values = input_values_for_day(date)
            next if input_values.empty?
            Truck.joins(:input_values).where(input_values: {id: input_values.ids}).uniq.each do |truck|
              truck_input_values = truck.input_values.where(id: input_values.ids)
              client = truck_input_values.first.input.client
              result << input_values.first.created_at.strftime('%d.%B')
              result << truck.number_plate
              if client.fraktnr
                result << truck_input_values.joins(:input).where(inputs: {name: I18n.t('client.form.fraktnr_low_case')})&.first&.value
              end
              if client.points
                point_id = truck_input_values.joins(:input).where(inputs: {name: 'points'})&.first&.value
                result << Point.find_by(id: point_id)&.name
              end
              simpleinputs = simple_inputs_for_truck(truck_input_values)
              @total_sums = [total_sums, simpleinputs.map(&:to_f)].transpose.map {|x| x.reduce(:+)}
              result << simpleinputs
              result << truck_input_values.joins(:input).where(inputs: {name: I18n.t('input_value.kommentar')})&.first&.value
            end
          end
        end.flatten
        res
      end

      def simple_inputs_for_truck(truck_input_values)
        truck_input_values.joins(:input).where.not(inputs: {name: [I18n.t('client.form.fraktnr_low_case'), I18n.t('client.form.points_for_form'), I18n.t('input_value.kommentar')]}).map(&:value)
      end

      def input_values_for_day(date)
        InputValue.joins(:input).where(created_at: date.beginning_of_day..date.end_of_day, inputs: {client_id: model.id})
      end

      def trucks
        trucks ||= Truck.joins(input_values: :input).where(input_values: {
                                                                input: {
                                                                        client_id: model.id,
                                                                        updated_at: current_month} })
      end

      def date_beginning_of_month
        Date.parse(options[:date].beginning_of_month.to_s)
      end

      def date_end_of_month
        Date.parse(options[:date].end_of_month.to_s)
      end

      def current_month
        @month ||= options[:date].beginning_of_month..options[:date].end_of_month
      end

      def row_franktnt_points_inputs_length
          res = 2
          res += 1 if model.fraktnr
          res += 1 if model.points
      end
    end
  end
end
