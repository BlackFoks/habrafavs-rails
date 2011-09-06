# scripts for the whool app

jQuery(document).ready ->
  # click on the menu on the topbar
  $("a.menu").click ->
    # get objects
    target = $(this)
    parent = target.parent("li")
    siblings = target.siblings("ul.menu-dropdown")
    parentSiblings = parent.siblings("li")

    # check
    if parent.hasClass("open")
      parent.removeClass("open")
      siblings.hide()
    else
      parent.addClass("open")
      siblings.show()

    # hide
    parentSiblings.children("ul.menu-dropdown").hide()
    parentSiblings.removeClass("open")
    false

  # close message
  $(".close").click ->
    parent = $(this).parent("div")
    parent.fadeOut()
    false

  # attach facebox
  $('a[rel*=facebox]').facebox()
