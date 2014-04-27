#= require knockout
#= require knockout.mapping
#= require moment

window.App ?= {}

class App.ShiftViewModel
  constructor: (data) ->
    @position = ko.observable(data.position)
    @startTime = ko.observable(moment(data.startTime, 'H'))
    @endTime = ko.observable(moment(data.endTime, 'H'))
    @templateDurationInMinutes = ko.observable(24*60)
    @leftSidePercentage = ko.observable(0)
