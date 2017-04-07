class Point
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(_options, params:, **)
      params[:points].each do |key, value|
        key.start_with?('new') ? ::Point::Create.call(value) : ::Point::Update.call(value.merge!(id: key))
      end
    end
  end
end
