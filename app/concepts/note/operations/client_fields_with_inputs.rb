class Note
  class ClientFieldsWithInputs < Trailblazer::Operation
    step Model(::Client, :find)
    step :setup_inputs

    def setup_inputs(options, model:, **)
      options['model'] = model.inputs
    end
  end
end
