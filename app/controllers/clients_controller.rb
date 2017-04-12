class ClientsController < ApplicationController
  cell_path 'client'

  def index
    run Client::Index
    render_form :index, result: result
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
    render_form :new, layout: false
  end

  def destroy
    run Client::Destroy
    render json: { notice: I18n.t('driver.destroy') }
  end

  def new_input
    render_form :new_input, result: nil, layout: false
  end
end
