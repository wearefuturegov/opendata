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

    metrics = PopulationMetric.where(audience: audience, area: area)
      .order("date")
      .group_by(&:title)

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
        ["Population growth", 0] + records[1..-1].map {|r| percentage_change(records[0].count, r.count) }
      ],
      legend: [
        "Population growth"
      ] + metrics.keys
    }

    metrics.each do |title, values|
      chart[:columns] << [title] + records.map do |r|
        if (found = values.detect {|d| d.date == r.date })
          percentage_change(values[0].count, found.count)
        else
          nil
        end
      end
    end
    chart
  end

  def percentage_change(from, to)
    (100 * (to - from) / from.to_f).round
  end
end
