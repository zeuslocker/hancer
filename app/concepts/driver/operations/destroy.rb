class Driver
  class Destroy < Trailblazer::Operation
    step Model(::Driver, :find)
    step ::TrailblazerHelpers::Steps::Destroy
  end
end
