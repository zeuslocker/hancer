class Client
  class Destroy < Trailblazer::Operation
    step Model(::Client, :find)
    step ::TrailblazerHelpers::Steps::Destroy
  end
end
