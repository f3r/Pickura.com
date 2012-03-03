jQuery ->
  for link in $(".navbar .nav a")
    do (link) ->
      if !(window.location.pathname.search(link.pathname))
        $(link).parent().toggleClass("active")