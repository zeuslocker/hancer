class Bill
  class Index < Trailblazer::Operation
    success :setup_date
    step :setup_models

    def setup_date(options, params:, **)
      options['date'] = (params[:date]&.send(:+, '-1') || Time.current).to_date
    end

    def setup_models(options, date:, **)
      options['clients'] = ::Client.joins(inputs: :input_values).where(inputs: {input_values: {date: date.beginning_of_month..date.end_of_month}}).uniq
    end
  end
end
