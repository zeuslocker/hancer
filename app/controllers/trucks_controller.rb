class TrucksController < ApplicationController
  cell_path 'truck'

  def index
    run Truck::Index
    render_form :index, result_obj: result
  end

  def update_collection
    run Truck::UpdateCollection do |_result|
      flash[:notice] = I18n.t('truck.create')
      redirect_to(action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'trucks', action: 'index'
  end

  def new_field
    run Truck::New
    render_form :new, result_obj: result, layout: false
  end

  def destroy
    run Truck::Destroy
    render json: { notice: I18n.t('truck.destroy') }
  end
end
