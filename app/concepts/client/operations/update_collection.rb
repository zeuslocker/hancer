class Client
  class UpdateCollection < Trailblazer::Operation
    step TrailblazerHelpers::Steps::ReverseParams
    step :prepare_params
    step :create_or_update

    def prepare_params(_options, params:, **)
      params[:clients].each do |_k, v|
        next unless v[:inputs]
        v[:inputs].each do |key, value|
          value.merge!(id: key)
        end
        v[:inputs] = v[:inputs].values
      end
    end

    def create_or_update(_options, params:, **)
      params[:clients].each do |key, value|
        key.start_with?('new') ? ::Client::Create.call(value) : ::Client::Update.call(value.merge!(id: key))
      end
    end
  end
end
