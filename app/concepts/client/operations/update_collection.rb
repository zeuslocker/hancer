class Client
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(_options, params:, **)
      binding.pry
      params[:clients].each do |key, value|
        key.start_with?('new') ? ::Client::Create.call(value) : ::Driver::Update.call(value.merge!(id: key))
      end
    end
  end
end
