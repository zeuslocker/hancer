class DriversController < ApplicationController
  cell_path 'driver'

  def index
    run Driver::Index
    render_form :index
  end

  def create
    run Driver::Create do |result|
      redirect_to action: :index and return
    end
  end

  def new
    run Driver::New
    render_form :new
  end
end
