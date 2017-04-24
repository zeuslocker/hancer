class BillsController < ApplicationController
  cell_path 'bill'
  def index
    run Bill::Index
    render_form :index, result: result
  end
end
