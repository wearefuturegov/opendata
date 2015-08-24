module AreasHelper
  # Helper to determine the gender percentage of an area
  def gender_percentage(area, gender)
    return "#{((Float( gender ) / area.total_population) * 100).round}%"
  end
end
