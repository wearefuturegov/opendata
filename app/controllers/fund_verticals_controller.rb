class FundVerticalsController < ApplicationController

  def index
    @audience = Audience.find(params[:audience_id])
    @area = Area.find(params[:area_id])
    @fund_verticals = @area.fund_verticals.with_audience(@audience)
  end

end
