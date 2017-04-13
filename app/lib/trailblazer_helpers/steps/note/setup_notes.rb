module TrailblazerHelpers
  module Steps
    module Note
      class SetupNotes
        extend Uber::Callable

        def self.call(options, params:, **)
          options['notes'] = notes_for_actual_day(date: params[:date] || Time.current)
        end

        def self.notes_for_actual_day(date: Time.current)
          ::Note.where('(updated_at >= ?) AND (updated_at <= ?)', date.beginning_of_day, date.end_of_day)
        end

        private_class_method :notes_for_actual_day
      end
    end
  end
end
