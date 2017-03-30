class TrucksController < ApplicationController
  cell_path 'truck'

  def index
    run Truck::Index
    render_form :index, result: result
  end

  def destroy
    run Truck::Destroy do |_result|
      flash[:notice] = I18n.t('truck.destroy')
      redirect_to(controller: 'trucks', action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to(controller: 'trucks', action: :index)
  end
end
