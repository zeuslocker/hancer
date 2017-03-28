class Driver
  class Index < Trailblazer::Operation
    step :setup_model!
    
    def setup_model!(options, **)
      options['model'] = ::Driver.all
    end
  end
end
