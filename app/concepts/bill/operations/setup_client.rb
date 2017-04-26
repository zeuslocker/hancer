class Bill
  class SetupClient < Trailblazer::Operation
    step ::TrailblazerHelpers::Steps::Client::SetupModelClient
  end
end
