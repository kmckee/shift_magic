#= require knockout
#= require moment

window.App ?= {}

class App.ShiftViewModel
  constructor: (data) ->
    @position = ko.observable(data.position)
    @startTime = ko.observable(moment(data.startTime, 'H'))
    @endTime = ko.observable(moment(data.endTime, 'H'))
