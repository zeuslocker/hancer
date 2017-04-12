class Client
  class Cell
    class NewInput < Trailblazer::Cell
      include ::TrailblazerHelpers::Cells::UniqKey
      def client_id
        params[:client_id]
      end

      def input_id
        "new#{new_key}"
      end
    end
  end
end
