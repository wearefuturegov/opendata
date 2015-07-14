class FundVerticalsController < ApplicationController

  def show
    @audience = Audience.find(params[:audience_id])
    @area = Area.find(params[:area_id])
    @fund_vertical = Area.find(params[:id])
  end

end
