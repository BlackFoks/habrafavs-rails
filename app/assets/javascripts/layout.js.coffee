# scripts for the whool app

jQuery(document).ready ->
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
