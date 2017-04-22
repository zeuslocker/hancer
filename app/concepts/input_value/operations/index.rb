require_relative '../../admin/contracts/admin_form.rb'
class InputValue
  class Index < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Admin::Contract::AdminForm

    step :setup_model
    step ::Trailblazer::Operation::Contract::Build()

    def setup_model(options, **)
      options['model'] = ::Admin.take
    end
  end
end
