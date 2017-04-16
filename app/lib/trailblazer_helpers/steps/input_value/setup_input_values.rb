module TrailblazerHelpers
  module Steps
    module InputValue
      class SetupInputValues
        extend Uber::Callable

        def self.call(options, params:, **)
          options['input_values'] = input_values_for_actual_day(date: params[:date] || Time.current)
        end

        def self.input_values_for_actual_day(date: Time.current)
          ::InputValue.where('(updated_at >= ?) AND (updated_at <= ?)', date.beginning_of_day, date.end_of_day)
        end

        private_class_method :input_values_for_actual_day
      end
    end
  end
end
