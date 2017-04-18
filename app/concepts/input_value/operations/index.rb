class InputValue
  class Index < Trailblazer::Operation
    step :setup_trucks_with_input_values
    
    def setup_trucks_with_input_values(options, params:, **)
      options['model'] = ::Truck.left_joins(:input_values).all
    end
  end
end
