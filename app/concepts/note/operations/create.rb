class Note
  class Create < Trailblazer::Operation
    extend ::Trailblazer::Operation::Contract::DSL

    contract ::Note::Contract::NoteForm

    step Model(::Note, :new)
    step :prepare_params
    success :check
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    success :check
    step ::Trailblazer::Operation::Contract::Persist()

    def check(options, params:, **)
      binding.pry
    end

    def prepare_params(options, params:, **)
      params[:clients] = params[:clients].values
    end
  end
end
