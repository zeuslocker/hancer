require_relative '../../admin/contracts/admin_form.rb'
class InputValue
  class Index < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Admin::Contract::AdminForm

    step :setup_model
    step :setup_date
    step ::Trailblazer::Operation::Contract::Build()

    def setup_date(options, params:, **)
      options['model_date'] = params.fetch(:date, Time.current).to_time
    end

    def setup_model(options, **)
      options['model'] = ::Admin.take
    end
  end
end
