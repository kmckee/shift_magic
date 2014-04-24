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
  constructor: (data) ->
    @position = ko.observable(data.position)
    @startTime = ko.observable(data.startTime)
    @endTime = ko.observable(data.endTime)
