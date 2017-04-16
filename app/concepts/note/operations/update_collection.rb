class Note
  class UpdateCollection < Trailblazer::Operation
    step :create_or_update

    def create_or_update(_options, params:, **)
      params[:notes].each do |key, value|
        value[:id].start_with?('new') ? ::Note::Create.call(value) : ::Note::Update.call(value)
      end
    end
  end
end
