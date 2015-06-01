class AudiencesController < ApplicationController

  def show
    @audience = Audience.find(params[:id])
    @area = Area.find(params[:area_id])

    respond_to do |format|
      format.html
      format.js
    end
  end

end
