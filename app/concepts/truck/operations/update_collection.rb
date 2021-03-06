class Truck
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(options, params:, **)
      params[:trucks].each do |key, value|
        key.start_with?('new') ? ::Truck::Create.call(value) : ::Truck::Update.call(value.merge!(id: key))
      end
    end
  end
end
