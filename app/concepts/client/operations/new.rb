class Client
  class New < Trailblazer::Operation
    extend Trailblazer::Operation::Contract::DSL

    contract ::Client::Contract::ClientForm

    step Model(::Client, :new)
    step ::Trailblazer::Operation::Contract::Build()
  end
end
