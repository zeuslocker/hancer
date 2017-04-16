class Note
  class Create < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Note::Contract::NoteForm

    step Model(::Note, :new)
    step :prepare_params
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()

    def prepare_params(options, params:, **)
      params[:clients] = params[:clients].values
    end
  end
end
