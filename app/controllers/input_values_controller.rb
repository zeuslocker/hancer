class InputValuesController < ApplicationController
  cell_path 'input_value'

  def index
    run InputValue::Index
    render_form :index, result: result
  end

  def update_collection
    run InputValue::UpdateCollection do |_result|
      flash[:notice] = I18n.t('driver.create')
      redirect_to(action: :index) && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'input_values', action: 'index'
  end

  def edit_truck_block
    render_form :edit_truck_block, result: nil, layout: false
  end

  def client_fields_with_inputs
    run InputValue::ClientFieldsWithInputs
    render_form :client_fields_with_inputs, result: result, layout: false
  end

  def new_client_select
    render_form :new_client_select, layout: false
  end

  def new_field
    #  run Note::New
    #  render_form :new, result: result, layout: false
  end

  def destroy
    #  run Note::Destroy
    #  render json: { notice: I18n.t('driver.destroy') }
  end
end
