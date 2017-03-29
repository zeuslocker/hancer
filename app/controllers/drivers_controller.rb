class DriversController < ApplicationController
  cell_path 'driver'

  def index
    run Driver::Index
    render_form :index, result: result
  end

  def create
    run Driver::Create do |result|
      redirect_to action: :index and return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to :controller => "drivers", :action => "index"
  end

  def new
    run Driver::New
    render_form :new
  end

  def destroy
    run Driver::Destroy do |result|
      flash[:notice] = 'Success Destroy!'
      redirect_to :controller => "drivers", :action => "index" and return
    end
  end
end
