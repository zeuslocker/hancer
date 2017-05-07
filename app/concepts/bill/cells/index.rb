class Bill
  module Cell
    class Index < Trailblazer::Cell
      include TrailblazerHelpers::Cells::ResultObject

      def navbar
        concept('bill/cell/navbar', result['date'].strftime('%Y-%m'))
      end
      def show_bills
        concept('bill/cell/show', collection: result['clients'], params: params, date: result['date'])
      end
    end
  end
end
