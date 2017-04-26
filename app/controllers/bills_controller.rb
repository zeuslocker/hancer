require "prawn"

class BillsController < ApplicationController
  include ::ActionView::Helpers::OutputSafetyHelper
  cell_path 'bill'
  def index
    run Bill::Index
    render_form :index, result: result
  end

  def bill_pdf
    run Bill::SetupClient
    respond_to do |format|
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(raw(concept('bill/cell/table', result['model'], date: params[:date].to_time).show))
        send_data pdf, :filename => "bill.pdf", :type => 'application/pdf', :disposition => params[:disposition]
      end
    end
  end
end
