class NotesController < ApplicationController
  cell_path 'note'

  def index
    run Note::Index
    render_form :index
  end

  def update_collection
    #  run Note::UpdateCollection do |_result|
    #    flash[:notice] = I18n.t('driver.create')
    #    redirect_to(action: :index) && return
    #  end
    #  flash[:alert] = AlertsViewHandler.call(result)
    #  redirect_to controller: 'notes', action: 'index'
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
