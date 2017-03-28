class DriversController < ApplicationController
  cell_path 'driver'

  def index
    run Driver::Index
    render_form :index
  end
end
