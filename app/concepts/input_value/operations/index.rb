class InputValue
  class Index < Trailblazer::Operation
    step ::TrailblazerHelpers::Steps::InputValue::SetupInputValues
    step :order_input_values
    step ::TrailblazerHelpers::Steps::Truck::SetupTrucks
    
    def order_input_values(options, **)
      options['input_values'].order!(created_at: :desc)
    end
  end
end
