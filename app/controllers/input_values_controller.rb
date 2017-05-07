class InputValuesController < ApplicationController
  cell_path 'input_value'

  def index
    run InputValue::Index
    render_form :index, result_obj: result
  end

  def update_collection
    run InputValue::UpdateCollection do |_result|
      flash[:notice] = I18n.t('driver.create')
      redirect_to(action: :index, date: params[:reform][:date].to_time.strftime('%Y-%m-%d')) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'input_values', action: 'index', date: params[:reform][:date].to_time.strftime('%Y-%m-%d')
  end

  def edit_truck_block
    render_form :edit_truck_block, layout: false
  end

  def destroy
    run InputValue::DestroyCollection
    render json: {notice: I18n.t('input_value.collection_destroy')}
  end
end
