class Driver
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(_options, params:, **)
      params[:drivers].each do |key, value|
        key.start_with?('new') ? ::Driver::Create.call(value) : ::Driver::Update.call(value.merge!(id: key))
      end
    end
  end
end
