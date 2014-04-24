#= require knockout
#= require knockout.mapping

window.App ?= {}

class App.ShiftPageViewModel
  constructor: (data) ->
    @positions = ko.observableArray(data.positions)
    ko.mapping.fromJS(data, shiftMapping, this)
    
  shiftMapping =
    'shifts':
      create: (options) ->
        return new App.ShiftViewModel(options.data)

class App.ShiftViewModel
  constructor: (position, startTime, endTime) ->
    @position = ko.observable(position)
    @startTime = ko.observable(startTime)
    @endTime = ko.observable(endTime)
