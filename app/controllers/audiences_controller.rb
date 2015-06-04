class AudiencesController < ApplicationController

  def show
    @audience = Audience.find(params[:id])
    @area = Area.find(params[:area_id])

    # Loads via AJAX no need for layout style
    render layout: false
  end

end
