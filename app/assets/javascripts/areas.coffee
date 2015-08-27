ready = ->
  chart = null
  supertabs = $(".super-tab-wrapper")

  # On click toggle classes
  supertabs.on "click", ".super-tab.unselected", ->
    t = $(this)

    if !t.hasClass('disabled')
      t.removeClass("unselected").addClass("selected")

      # Deselect other tabs
      t.siblings().addClass("unselected").removeClass("selected")
      t.trigger("selected")

  # On select load views via AJAX
  supertabs.on "selected", (e) ->
    loadChart($(e.target).data("chart-url"), $("#chart-container"))
    loadCards($(e.target).data("details-url"), $("#card-wrapper"))

  chartOptions =
    data:
      x: "x"
      columns: [0]
    axis:
      x:
        type: "spline"
    bindto: ".chart"
    transition:
      duration: 1000
    grid:
      y:
        show: true
        min: 0
    legend:
      show: false
    line:
      connectNull: true

  # Initialise chart
  initChart = (container) ->
    chart = c3.generate(chartOptions)

  # Custom chart legend
  renderLegend = (data) ->
    # Append li
    d3.select('.legend').selectAll('li').data(data["legend"])
      .enter().append 'li'
      .attr('class', 'key', 'data-id', (id) -> id)
      .html((id) -> id
    ).each((id) ->
      li = d3.select(this)
      # Add toggle bubble
      span = li.insert "span"
      # Style toggle bubble
      span.attr("class", "toggle").style('background-color', chart.color(id))
    ).on('mouseover', (id) ->
      # Mouseover focus data
      chart.focus id
    ).on('mouseout', (id) ->
      chart.revert
    ).on 'click', (id) ->
      # On click toggle class
      $(this).toggleClass 'active'
      chart.toggle id

  updateChart = (data) =>
    updateChartHeader(data)
    chart.load
      columns: data["columns"]
    renderLegend(data)

  # Update chart header on load
  updateChartHeader = (data) =>
    $('#chart-container .chart-header').attr('id', "tab_" + data["title"][1])
    $('#chart-container .chart-header h2').text(data["title"][0])

  loadChart = (url, container) ->
    $.ajax
      url: url
      dataType: "json"
      success: (data, status, xhr) =>
        updateChart(data)
      error: (data, status, xhr) ->
        console.error(data, status, xhr)

  loadCards = (url, container) ->
    $.ajax
      url: url
      dataType: "html"
      success: (data, status, xhr) =>
        container.html(data)
      error: (data, status, xhr) =>
        console.error(data, status, xhr)

  initChart()
  supertabs.find(".selected").trigger("selected")

$(document).ready(ready)
# Wait for turbolinks
$(document).on('page:load', ready)
