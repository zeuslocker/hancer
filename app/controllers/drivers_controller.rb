class DriversController < ApplicationController
  cell_path 'driver'

  def index
    run Driver::Index
    render_form :index, result: result
  end

  def new_field
    run Driver::New
    render_form :new, result: result, layout: false
  end

  def update_collection
    run Driver::UpdateCollection do |_result|
      flash[:notice] = I18n.t('driver.create')
      redirect_to(action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'drivers', action: 'index'
  end

  def destroy
    run Driver::Destroy
    render json: { notice: I18n.t('driver.destroy') }
  end
end
