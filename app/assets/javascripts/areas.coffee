$(document).ready ->
  supertabs = $(".super-tab")

  # Loop tabs and work out if it's current
  supertabs.each (index, element) =>
    t = $(element)

    # Get id of tab
    id = t[0].id
    i = id.substr(id.length - 1)

    # Get current URL
    url = window.location.href

    if (url.indexOf("audience") >= 0)
      u = url.substr(url.length - 1)
      # Toggle classes
      if i == u
        t.addClass('selected')
        t.removeClass('unselected')
      else
        t.removeClass('selected')
        t.addClass('unselected')


  # On click visit audience
  supertabs.click ->
    t = $(this)

    # Find link
    link = t.children().find("a")[0].href

    # Goto link
    window.location = link
