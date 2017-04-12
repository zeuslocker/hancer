class Client
  class Update < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract Client::Contract::ClientForm

    step Model(::Client, :find_by)
    step ::Trailblazer::Operation::Contract::Build()
    step ::Trailblazer::Operation::Contract::Validate()
    step ::Trailblazer::Operation::Contract::Persist()
  end
end
