class TrucksController < ApplicationController
  cell_path 'truck'
  def index
    run Truck::Index
    render_form :index, result: result
  end
end
