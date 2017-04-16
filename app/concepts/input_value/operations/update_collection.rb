class InputValue
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(_options, params:, **)
      params[:trucks].each do |truck_key, truck_value|
        truck_value[:input_values]&.each do |input_value|
          if input_value[:id].start_with?('new')
            InputValue::Create.call(input_value.merge!(truck_id: truck_value[:id], driver_id: truck_value[:driver_id]))
          else
            InputValue::Update.call(input_value.merge!(truck_id: truck_value[:id], driver_id: truck_value[:driver_id]))
          end
        end
      end
    end
  end
end
