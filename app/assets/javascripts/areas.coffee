ready = ->
  # Load a url via AJAX
  loadAJAX = (url) ->
    $('#chart-container').load url,(responseText, textStatus, XMLHttpRequest) ->
      if (textStatus == 'success')
        generateChart()
      else
        console.log(textStatus)
        console.log(responseText)

  supertabs = $(".super-tab")

  firsttab = supertabs[0]
  href = firsttab.attributes[1].value

  # Load first tab by default
  loadAJAX(href)

  # On click toggle classes
  supertabs.click ->
    t = $(this)

    # Don't run if already active
    if (t.attr('class') != 'super-tab selected')
      # Toggle classes
      t.toggleClass('unselected')
      t.toggleClass('selected')

      # Deselect other tabs
      t.siblings().addClass('unselected')
      t.siblings().removeClass('selected')

      href = t[0].attributes[1].value

      # Load via ajax
      loadAJAX(href)

  generateChart = ->
    # Render chart
    chart = c3.generate(
      data:
        columns: [ 
          [ "Foo", 30, 200, 100, 400, 150, 250 ],
          [ "Bar", 130, 100, 140, 200, 150, 50 ],
          [ "Baz", 40, 50, 60, 70, 80, 90]
        ]
        type: 'spline'

      bindto: '.chart'
      transition:
        duration: 1000
      grid:
        y: 
          show: true
      legend:
        show: false
    )

    # Render legend
    d3.select('.legend').selectAll('li').data([
      'Foo'
      'Bar'
      'Baz'
    ]).enter().append('li').attr('class', 'key', 'data-id', (id) ->
      id
    ).html((id) ->
      id
    ).each((id) ->
      li = d3.select(this)
      # Add toggle bubble
      span = li.insert("span")
      # Style toggle bubble
      span.attr("class", "toggle").style('background-color', chart.color(id))
    ).on('mouseover', (id) ->
      # Mouseover focus data
      chart.focus id
    ).on('mouseout', (id) ->
      chart.revert()
    ).on 'click', (id) ->
      # On click toggle class
      $(this).toggleClass('active')
      chart.toggle id

$(document).ready(ready)
# Wait for turbolinks
$(document).on('page:load', ready)
