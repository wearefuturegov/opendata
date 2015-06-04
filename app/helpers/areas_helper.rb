module AreasHelper
  # Helper to determine which audience is selected and create an HTML friendly ID 
  # Enables us to change the background color of the chart header
  def chart_heading_id
    if @audience.present?
      return "tab_" + @audience.id.to_s
    end
  end
end
