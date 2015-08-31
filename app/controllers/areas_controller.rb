class AreasController < ApplicationController

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @home_stats = CareHomeAreaFacade.new(@area)
    @horizon_year = Date.current.year + 5
  end

end
