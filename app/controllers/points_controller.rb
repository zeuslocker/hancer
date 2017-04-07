class PointsController < ApplicationController
  cell_path 'point'

  def index
    run Point::Index
    render_form :index, result: result
  end

  def update_collection
    run Point::UpdateCollection do |_result|
      flash[:notice] = I18n.t('driver.create')
      redirect_to(action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'points', action: 'index'
  end

  def new_field
    run Point::New
    render_form :new, result: result, layout: false
  end

  def destroy
    run Point::Destroy
    render json: { notice: I18n.t('driver.destroy') }
  end
end
