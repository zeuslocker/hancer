class Bill
  module Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('bill/cell/navbar', model['date'].strftime('%Y-%m-%d'))
      end
      def show_bills
        concept('bill/cell/show', collection: model['clients'], params: params)
      end
    end
  end
end
