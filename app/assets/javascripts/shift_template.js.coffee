# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $("#positions li").draggable
    appendTo: "body",
    helper: "clone"

  $("#shifts").droppable
    activeClass: "ui-state-default"
    hoverClass: "ui-state-hover"
    accept: ":not(.ui-sortable-helper)"
    drop: (event, ui) ->
      $(this).find(".placeholder").remove()
      $("<div></div>").text(ui.draggable.text()).resizable({handles: 'e, w', grid: 50}).appendTo(this)
  .sortable
    items: "div"
    placeholder: "ui-state-highlight"
    sort: ->
      # gets added unintentionally by droppable interacting with sortable
      # using connectWithSortable fixes this, but doesn't allow you to customize active/hoverClass options
      $(this).removeClass("ui-state-default")
  $("#shifts div").resizable
    #handles: "e, w"
