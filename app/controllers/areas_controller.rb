class AreasController < ApplicationController

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @horizon_year = Date.current.year + 5
  end

end
