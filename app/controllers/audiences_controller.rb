class AudiencesController < ApplicationController

  def breakdown
    @audience = Audience.find(params[:id])

    # Loads via AJAX no need for layout style
    render layout: false
  end

  def show
    @audience = Audience.find(params[:id])
    @area = Area.find(params[:area_id])

    # Loads via AJAX no need for layout style
    render layout: false
  end

end
