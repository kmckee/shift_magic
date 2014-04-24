#= require knockout
#= require knockout.mapping
#= require moment

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
    @startTime = ko.observable(moment(data.startTime, 'H'))
    @endTime = ko.observable(moment(data.endTime, 'H'))
