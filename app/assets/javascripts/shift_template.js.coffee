# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require knockout

ko.bindingHandlers.draggable =
  init: (element) ->
    $(element).draggable
      appendTo: "body"
      helper: "clone"

ko.bindingHandlers.allowsDropAndSortOfShifts =
  init: (element) ->
    $(element).droppable
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
        $(this).removeClass("ui-state-default")

$ ->
  fakeServerData =
    positions: ["Server", "Hostess", "Dishwasher"]
    shifts: []
    shiftName: "Kyle"

  ko.applyBindings(new App.ShiftPageViewModel(fakeServerData))
