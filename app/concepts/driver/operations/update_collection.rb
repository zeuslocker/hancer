class Driver
  class UpdateCollection < Trailblazer::Operation
    step TrailblazerHelpers::Steps::ReverseParams
    step :create_or_update

    def create_or_update(_options, params:, **)
      params[:drivers].each do |key, value|
        value[:id] ? ::Driver::Update.call(value) : ::Driver::Create.call(value)
      end
    end
  end
end
