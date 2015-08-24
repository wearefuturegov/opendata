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

    metrics = PopulationMetric.where(audience: audience, area: area).group_by(&:title)

    render json: chart_data(audience, pop, metrics)
  end

  def chart_data(audience, records, metrics)
    chart = {
      title: [
        audience.title,
        audience.id
      ],
      columns: [
        ["x"] + records.map {|r| r.date.year },
        ["pop"] + records.map(&:count)
      ],
      legend: [
        audience.title
      ] + metrics.keys
    }

    metrics.each_with_index do |(title, values), i|
      chart[:columns] << ["metrics%s" % i] + records.map do |r|
        if found = values.detect {|d| d.date == r.date }
          found.count
        else
          nil
        end
      end
    end
    chart
  end
end
