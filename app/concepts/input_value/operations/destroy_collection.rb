class InputValue
  class DestroyCollection < Trailblazer::Operation
    step :setup_model
    success :destroy_collection

    def setup_model(options, params:, **)
      options['model'] = ::InputValue.where(id: params[:input_values_ids])
    end

    def destroy_collection(options, **)
      options['model'].destroy_all
    end
  end
end
