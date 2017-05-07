class Bill
  module Cell
    class Show < Trailblazer::Cell

      def client_bill_table
        concept('bill/cell/table', model, context: {params: params}, date: options[:date]).show
      end

      def collapse_btn
        link_to(image_tag('Collapse.png'), nil, class: 'collapse_btn col-sm-4 col-xs-4')
      end

      def download_pdf
        link_to(image_tag('Download_PDF.png'), bill_pdf_bills_path(id: model.id, date: options[:date].to_s, format: :pdf, disposition: :attachment), class: 'download-pdf col-sm-4 col-xs-4')
      end

      def print_pdf
        link_to(image_tag('Print.png'), bill_pdf_bills_path(id: model.id, date: options[:date].to_s, format: :pdf, disposition: :inline), class: 'download-pdf col-sm-4 col-xs-4')
      end
    end
  end
end
