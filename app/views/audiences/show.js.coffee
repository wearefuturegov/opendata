$('#chart-container').html '<%= escape_javascript(render @audience) %>'
$('#spotlight-container').html "<%= escape_javascript(render 'spotlight') %>"

# Display chart
# TODO: Add real data!
# -----
chart = c3.generate(
  data:
    columns: [ 
      [ "Foo", 30, 200, 100, 400, 150, 250 ],
      [ "Bar", 130, 100, 140, 200, 150, 50 ],
      [ "Baz", 40, 50, 60, 70, 80, 90]
    ]
    type: 'spline'
    hide: true

  bindto: '.chart'
  grid:
    y: 
      show: true
  legend:
    show: false
)

# Create custom legend
# http://c3js.org/samples/legend_custom.html
# -----
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
