require_relative '../../admin/contracts/admin_form.rb'
class InputValue
  class Index < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Admin::Contract::AdminForm

    step :setup_model
    step :setup_date
    step ::Trailblazer::Operation::Contract::Build()
    step :form_prepopulate
    def setup_date(options, params:, **)
      date = params[:date].present? ? params[:date].to_date : Time.current.to_date
      options['model_date'] = date
    end

    def setup_model(options, **)
      options['model'] = ::Admin.take
    end

    def form_prepopulate(options, model_date:, **)
      options['contract.default'].prepopulate!(date: model_date)
    end
  end
end
