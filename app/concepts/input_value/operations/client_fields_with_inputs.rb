class InputValue
  class ClientFieldsWithInputs < Trailblazer::Operation
    step :setup_client
    success :setup_input_values

    def setup_client(options, params:, **)
      options['client'] = ::Client.find_by(id: params[:client_id])
    end

    def setup_input_values(options, client:, params:, **)
      date = params[:date].to_time
      options['input_values'] = []
      client.inputs.each do |input|
        options['input_values'] << input.input_values.find_by(truck_id: params[:truck_id],
                                                              driver_id: params[:driver_id],
                                                              updated_at: date.midnight..date.end_of_day)
      end
    end
  end
end
