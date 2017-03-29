class Driver
  class Index < Trailblazer::Operation
    step Nested( ::Driver::New )
    step :setup_drivers!

    def setup_drivers!(options, **)
      options['drivers'] = ::Driver.all
    end
  end
end
