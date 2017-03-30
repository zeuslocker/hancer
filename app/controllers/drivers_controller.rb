class DriversController < ApplicationController
  cell_path 'driver'

  def index
    run Driver::Index
    render_form :index, result: result
  end

  def create
    run Driver::Create do |_result|
      flash[:notice] = I18n.t('driver.create')
      redirect_to(action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'drivers', action: 'index'
  end

  def new
    run Driver::New
    render_form :new
  end

  def destroy
    run Driver::Destroy do |_result|
      flash[:notice] = I18n.t('driver.destroy')
      redirect_to(controller: 'drivers', action: 'index') && return
    end
  end
end
