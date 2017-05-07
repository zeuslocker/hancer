class ClientsController < ApplicationController
  cell_path 'client'

  def index
    run Client::Index
    render_form :index, result_obj: result
  end

  def update_collection
    run Client::UpdateCollection do |_result|
      flash[:notice] = I18n.t('client.create')
      redirect_to(controller: 'clients', action: 'index') && return
    end
    flash[:alert] = AlertsViewHandler.call(result)
    redirect_to controller: 'drivers', action: 'index'
  end

  def new_field
    run Client::New
    render_form :new, result_obj: result, layout: false
  end

  def destroy
    run Client::Destroy
    render json: { notice: I18n.t('driver.destroy') }
  end

  def new_input
    render_form :new_input, layout: false
  end
end
