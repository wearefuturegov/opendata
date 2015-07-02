module AreasHelper
  # Helper to determine which audience is selected and create an HTML friendly ID 
  # Enables us to change the background color of the chart header
  def chart_heading_id
    if @audience.present?
      return "tab_" + @audience.id.to_s
    end
  end

  # Helper to determine the gender percentage of an area
  def gender_percentage(area, gender)
    return "#{((Float( gender ) / area.total_population) * 100).round}%"
  end
end
