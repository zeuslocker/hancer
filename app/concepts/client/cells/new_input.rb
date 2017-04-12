class Client
  class Cell
    class NewInput < Trailblazer::Cell
      include ::TrailblazerHelpers::Cells::UniqKey
      def client_id
        model&.client_id || params[:client_id]
      end

      def input_id
        model&.id || "new#{new_key}"
      end

      def model_value
        model&.name
      end
    end
  end
end
