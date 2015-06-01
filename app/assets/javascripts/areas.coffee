ready = ->
  supertabs = $(".super-tab")

  # On click toggle classes
  supertabs.click ->
    t = $(this)

    t.toggleClass('unselected')
    t.toggleClass('selected')

    t.siblings().addClass('unselected')
    t.siblings().removeClass('selected')

$(document).ready(ready)
# Wait for turbolinks
$(document).on('page:load', ready)
