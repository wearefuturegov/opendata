class AudiencesController < ApplicationController
  def breakdown
    @audience = Audience.find(params[:id])
  end

  def show
    audience = Audience.find(params[:id])
    area = Area.find(params[:area_id])

    pop = Population.where(audience: audience, area: area)
                    .order("date")
                    .select("date, SUM(count) AS count")
                    .group("date")

    dementia_care_need = PopulationMetric.where(audience: audience, area: area, title: "Dementia care need")

    render json: chart_data(audience, pop, dementia_care_need)
  end

  def chart_data(audience, records, dementia)
    {
      columns: [
        ["x"] + records.map {|r| r.date.year },
        ["data1"] + records.map(&:count),
        ["data2"] + records.map {|r| if found = dementia.detect {|d| d.date == r.date } then found.count else nil end }
      ],
      legend: [
        audience.title,
        "Dementia care need"
      ]
    }
  end
end
