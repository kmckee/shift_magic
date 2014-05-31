# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require knockout
#= require knockout-sortable

ko.bindingHandlers.draggable =
  init: (element) ->
    $(element).draggable
      appendTo: "body"
      helper: "clone"

ko.bindingHandlers.allowShiftDrop =
  init: (element) ->
    $(element).droppable
      activeClass: "ui-state-default"
      hoverClass: "ui-state-hover"
      accept: ":not(.ui-sortable-helper)"
      drop: (event, ui) ->
        window.viewModel.shifts.push(new App.ShiftViewModel({
          position: ui.draggable.text()
          startTime: '00:00:00'
          endTime: '23:59:59'
        }))

ko.bindingHandlers.resizableShift =
  init: (element) ->
   $(element).resizable({
     handles: 'e, w',
     grid: 10,
     stop: (event, ui) ->
       element = ui.element[0]
       shiftViewModel = ko.contextFor(element).$data
       shiftViewModel.updateShiftDuration($(element))
    })

$ ->
  fakeServerData =
    positions: ["Server", "Hostess", "Dishwasher"]
    shifts: []
    shiftName: "Kyle"
  window.viewModel = new App.ShiftPageViewModel(fakeServerData)
  ko.applyBindings(window.viewModel)
