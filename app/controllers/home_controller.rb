class HomeController < ApplicationController
  def index
    render concept('home/cell/index', nil)
  end
end
