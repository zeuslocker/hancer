class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ::Trailblazer::Rails::Controller
  include RenderOperationHelper

  def self.cell_path(path = '')
    @path = path
  end
end
