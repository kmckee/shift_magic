# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

ko.bindingHandlers.draggable= {
  init: (element) ->
    $(element).draggable
      appendTo: "body",
      helper: "clone"
}

ko.bindingHandlers.allowsDropAndSortOfShifts = {
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
}

$ ->
  shiftMapping = {
    'shifts': {
      create: (options) ->
        position = options.data.position
        startTime = options.data.startTime
        endTime = options.data.endTime
        return new ShiftViewModel(position, startTime, endTime)
    }
  }

  fakeServerData = {
    positions: ["Server", "Hostess", "Dishwasher"]
    shifts: []
    test: "Kyle"
  }
  viewModel = ko.mapping.fromJS(fakeServerData, shiftMapping)
  ko.applyBindings(viewModel)

class PageViewModel
  constructor: () ->
    @positions = ko.observableArray()
    @shifts = ko.observableArray()
    @test = ko.observable("kyle")

class ShiftViewModel
  constructor: (position, startTime, endTime) ->
    @position = ko.observable(position)
    @startTime = ko.observable(startTime)
    @endTime = ko.observable(endTime)
