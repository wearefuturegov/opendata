class AudiencesController < ApplicationController
  
  def show
    @audience = Audience.find(params[:id])
    @area = Area.find(params[:area_id])
    render "areas/show"
  end
  
end
