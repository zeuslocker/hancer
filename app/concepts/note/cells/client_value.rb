class Note
  class Cell
    class ClientValue < Trailblazer::Cell
      def client_value
        ::InputValue.find_by(note_id: params[:note_id], input_id: model.id) || ::InputValue.new(input_id: model.id)
      end

      def index
        options[:index]
      end

      def client_index
        new_key
      end
    end
  end
end
