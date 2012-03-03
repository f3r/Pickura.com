jQuery ->
  for link in $(".navbar .nav a")
    do (link) ->
      if (window.location.pathname == link.pathname)
        $(link).parent().toggleClass("active")