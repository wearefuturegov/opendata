$('#chart-container').html '<%= escape_javascript(render @audience) %>'
$('#spotlight-container').html "<%= escape_javascript(render 'spotlight') %>"

# Display chart
# TODO: Add real data
chart = c3.generate(
  data:
    columns: [ 
      [ "data1", 30, 200, 100, 400, 150, 250 ],
      [ "data2", 130, 100, 140, 200, 150, 50 ]
    ]
  bindto: '.chart'
)
