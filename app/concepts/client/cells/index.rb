class Client
  class Cell
    class Index < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
      include TrailblazerHelpers::Cells::ResultObject
      
      def show_clients
        concept('client/cell/show', collection: result['clients'])
      end

      def navbar
        concept('client/cell/navbar', nil)
      end

      def new_input_field_link
        link_to nil, new_input_clients_path, class: 'input_field_link hide'
      end
    end
  end
end
